class ApplicationController < ActionController::Base
  protect_from_forgery

  def getPnadsByTema (tema)
    @pnads = []

    temas_filtros = TemasFiltro.where("tema_id = ?", tema.id)

    temas_filtros.each do |temas_filtro|
      # logger.debug("Filtro ID #{filtro_id.filtro_id}")
      filtro = Filtro.find(temas_filtro.filtro_id)
      @pnads += getPnadsByFiltro(filtro)
    end

    return @pnads
  end

  def getPnadsByFiltro (filtro)
    # logger.debug("Filtrando #{filtro.tipo}")
    @pnads = []
    config = {}

    consulta =  "tipo = ?  AND area = ?  AND fxid = ?  AND univ = ?  AND cor = ?  AND sexo = ?"
    valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, filtro.sexo ]

    pnad_bruto = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")
    config[:pnad] = { library: { title: { text: "#{filtro.titulo} - #{Filtro::FONTE.index(filtro.fonte)}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .3f}</b>' } } }
    pnad_trata = [ { name: 'Valor', data: pnad_bruto } ]

    if filtro.sexo == 3

      # Absoluto? ("#{filtro.objetivo} / 1000")
      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 1 ]
      pnad_homens = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 2 ]
      pnad_mulheres = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      pnad_trata = [ { name: "#{Filtro::SEXO.index(1)}", data: pnad_homens },
                     { name: "#{Filtro::SEXO.index(2)}", data: pnad_mulheres } ]
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

        pnad_trata = [ { name: "Homens #{Filtro::COR.index(1)}", data: pnad_homens_brancos },
                       { name: "Homens #{Filtro::COR.index(2)}", data: pnad_homens_negros  },
                       { name: "Mulheres #{Filtro::COR.index(1)}", data: pnad_mulheres_brancos }, 
                       { name: "Mulheres #{Filtro::COR.index(2)}", data: pnad_mulheres_negros  } 
                     ]

      else 
        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, filtro.sexo ]
        pnad_brancos = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, filtro.sexo ]
        pnad_negros = Pnad.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

        pnad_trata = [ { name: "#{Filtro::COR.index(1)}", data: pnad_brancos },
                       { name: "#{Filtro::COR.index(2)}", data: pnad_negros  } ]
      end

    end

    @pnads = [ { id: "#{filtro.titulo}", type: "#{filtro.tipo_grafico}", data: pnad_trata, config: config[:pnad] } ]

    return @pnads
  end

end
