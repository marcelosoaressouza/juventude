class ApplicationController < ActionController::Base
  protect_from_forgery

  def getPnads (params)
    @dados = []
    pnad_trata = []
    pnad_bruto = {}
    config = {}
    consulta = ""
  
    cons = [ "tipo", "area", "fxid", "univ", "cor", "sexo" ]
    valores  = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], params[:sexo] ]

    cons.each_with_index do |col, i|
      consulta += " #{col} = ?"
      consulta += " AND " if ! cons.to_a[i+1].nil?
    end

    titulo = "#{Pnad::OBJETIVO.index(params[:objetivo])} - #{Pnad::FXID.index(params[:fxid].to_i)} - #{Pnad::AREA.index(params[:area].to_i)} - #{Pnad::SEXO.index(params[:sexo].to_i)} - #{Pnad::COR.index(params[:cor].to_i)}"

    if params[:univ] =~ /,/
      universo = params[:univ].split(',')

      universo.each_with_index do |univ, i|
        valores = [ 1, params[:area], params[:fxid], univ, params[:cor], params[:sexo] ]
        pnad  = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])
        name = Pnad::UNIV.index(univ.to_i)
        resultado = { name: "#{name}", data: pnad }
        pnad_trata.push(resultado)
      end

    else
      pnad_bruto = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])
      pnad_trata = [ { name: 'Dados', data: pnad_bruto } ] if ! pnad_bruto.empty?

    end

    if params[:sexo] == '3'

      valores  = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], 1 ]
      pnad_homens = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

      valores  = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], 2 ]
      pnad_mulheres = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

      pnad_trata = [ { name: "#{Pnad::SEXO.index(1)}", data: pnad_homens },
                     { name: "#{Pnad::SEXO.index(2)}", data: pnad_mulheres } ] if (! pnad_homens.empty? || ! pnad_mulheres.empty?)
    end

    if params[:cor] == '3'
      if params[:sexo] == '3'
        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, 1 ]
        pnad_homens_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, 2 ]
        pnad_mulheres_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, 1 ]
        pnad_homens_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, 2 ]
        pnad_mulheres_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

        pnad_trata = [ { name: "Homens #{Pnad::COR.index(1)}", data: pnad_homens_brancos },
                       { name: "Homens #{Pnad::COR.index(2)}", data: pnad_homens_negros  },
                       { name: "Mulheres #{Pnad::COR.index(1)}", data: pnad_mulheres_brancos }, 
                       { name: "Mulheres #{Pnad::COR.index(2)}", data: pnad_mulheres_negros  } 
                     ] if (! pnad_homens_brancos.empty? || ! pnad_mulheres_brancos.empty? || ! pnad_homens_negros.empty? || ! pnad_mulheres_negros.empty?)

      else 
        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, params[:sexo] ]
        pnad_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, params[:sexo] ]
        pnad_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum(params[:objetivo])


        pnad_trata = [ { name: "#{Pnad::COR.index(1)}", data: pnad_brancos },
                       { name: "#{Pnad::COR.index(2)}", data: pnad_negros  } ] if (! pnad_brancos.empty? || ! pnad_negros.empty?)
      end

    end
	
    config[:pnad] = { library: { title: { text: titulo }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .3f}</b>' } } }

    @dados = [ { id: "dados_pnad", type: "line", data: pnad_trata, config: config[:pnad] } ] if pnad_trata
    
    return @dados 
  end

  def getDadosByTema (tema)
    @dados = []

    temas_filtros = TemasFiltro.where("tema_id = ?", tema.id).order("id DESC")

    temas_filtros.each do |temas_filtro|
      filtro = Filtro.find(temas_filtro.filtro_id)
      @dados += getDadosByFiltro(filtro)
    end

    return @dados
  end

  def getDadosByFiltro (filtro)
    @dados = []
    config = {}

    consulta =  "tipo = ?  AND area = ?  AND fxid = ?  AND univ = ?  AND cor = ?  AND sexo = ?"
    valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, filtro.sexo ]

    pnad_bruto = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

    titulo = "#{Pnad::OBJETIVO.index(filtro.objetivo)} -
              #{Pnad::UNIV.index(filtro.univ)} - 
              #{Pnad::FXID.index(filtro.fxid)} - 
              #{Pnad::SEXO.index(filtro.sexo)} - 
              #{Pnad::COR.index(filtro.cor)} - 
              #{Pnad::FONTE.index(filtro.fonte)}"

    config[:pnad] = { library: { title: { text: titulo },
                                 tooltip: { pointFormat: '{series.name}: <b>{point.y: .3f}</b>' }
                               }
                    }

    pnad_trata = [ { name: 'Valor', data: pnad_bruto } ]

    if filtro.sexo == 3

      # Absoluto? ("#{filtro.objetivo} / 1000")
      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 1 ]
      pnad_homens = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 2 ]
      pnad_mulheres = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      pnad_trata = [ { name: "#{Pnad::SEXO.index(1)}", data: pnad_homens },
                     { name: "#{Pnad::SEXO.index(2)}", data: pnad_mulheres } ]
    end

    if filtro.cor == 3
      if filtro.sexo == 3
        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, 1 ]
        pnad_homens_brancos = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, 2 ]
        pnad_mulheres_brancos = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, 1 ]
        pnad_homens_negros = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, 2 ]
        pnad_mulheres_negros = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        pnad_trata = [ { name: "Homens #{Pnad::COR.index(1)}", data: pnad_homens_brancos },
                       { name: "Homens #{Pnad::COR.index(2)}", data: pnad_homens_negros  },
                       { name: "Mulheres #{Pnad::COR.index(1)}", data: pnad_mulheres_brancos }, 
                       { name: "Mulheres #{Pnad::COR.index(2)}", data: pnad_mulheres_negros  } 
                     ]

      else 
        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, filtro.sexo ]
        pnad_brancos = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, filtro.sexo ]
        pnad_negros = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        pnad_trata = [ { name: "#{Pnad::COR.index(1)}", data: pnad_brancos },
                       { name: "#{Pnad::COR.index(2)}", data: pnad_negros  } ]
      end

    end

    @dados = [ { id: "#{filtro.titulo}", type: "#{filtro.tipo_grafico}", data: pnad_trata, config: config[:pnad] } ]

    return @dados
  end

end
