class PnadsController < ApplicationController
  def index
    @temas = Tema.all

    if (params[:tema])
      @objetivo = Tema.find(params[:tema])
    end
  end

  # GET /pnads/1
  # GET /pnads/1.json
  def show
    @dados = []

    if params
      @dados = getPnads(params)
    end

    respond_to do |format|
      format.js
    end
  end

  #
  # Dados da PNAD
  #
  def getPnads (params)
    @dados = []
    valores = []
    pnad_trata = []
    pnad_bruto = {}
    config = {}
    consulta = ""
    fxid = ""
  
    cons = [ "tipo", "area", "fxid", "univ", "cor", "sexo" ]
    valores = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], params[:sexo] ]

    if params[:fxid] == "9999"
      cons.delete('fxid')
      valores.delete('9999')
      fxid = " fxid IN ('1517', '1824', '2529') "
    end

    cons.each_with_index do |col, i|
      consulta += " #{col} = ?"
      consulta += " AND " if ! cons.to_a[i+1].nil?
    end

    titulo = "#{Pnad::OBJETIVO.index(params[:objetivo])} - #{Pnad::FXID.index(params[:fxid].to_i)} - #{Pnad::AREA.index(params[:area].to_i)} - #{Pnad::SEXO.index(params[:sexo].to_i)} - #{Pnad::COR.index(params[:cor].to_i)}"

    if params[:univ] =~ /,/
      universo = params[:univ].split(',')

      universo.each_with_index do |univ, i|
        valores = [ 1, params[:area], params[:fxid], univ, params[:cor], params[:sexo] ]
        valores.delete('9999') if params[:fxid] == "9999"

        # pnad  = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad  = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad  = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        name = Pnad::UNIV.index(univ.to_i)
        resultado = { name: "#{name}", data: pnad }
        pnad_trata.push(resultado)
      end

    else
      # pnad_bruto = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")
      if params[:fxid] == "9999"
        pnad_bruto = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
      else
        pnad_bruto = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
      end

      pnad_trata = [ { name: 'Dados', data: pnad_bruto } ] if ! pnad_bruto.empty?
    end

    if params[:sexo] == '3'
      valores  = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], 1 ]
      valores.delete('9999') if params[:fxid] == "9999"

      # pnad_homens = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

      if params[:fxid] == "9999"
        pnad_homens = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
      else
        pnad_homens = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
      end

      valores  = [ 1, params[:area], params[:fxid], params[:univ], params[:cor], 2 ]
      valores.delete('9999') if params[:fxid] == "9999"

      # pnad_mulheres = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

      if params[:fxid] == "9999"
        pnad_mulheres = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
      else
        pnad_mulheres = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
      end

      pnad_trata = [ { name: "#{Pnad::SEXO.index(1)}", data: pnad_homens },
                     { name: "#{Pnad::SEXO.index(2)}", data: pnad_mulheres } ] if (! pnad_homens.empty? || ! pnad_mulheres.empty?)
    end

    if params[:cor] == '3'
      if params[:sexo] == '3'
        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, 1 ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_homens_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_homens_brancos = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_homens_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, 2 ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_mulheres_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_mulheres_brancos = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_mulheres_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, 1 ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_homens_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_homens_negros = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_homens_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, 2 ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_mulheres_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_mulheres_negros = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_mulheres_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        pnad_trata = [ { name: "Homens #{Pnad::COR.index(1)}", data: pnad_homens_brancos },
                       { name: "Homens #{Pnad::COR.index(2)}", data: pnad_homens_negros  },
                       { name: "Mulheres #{Pnad::COR.index(1)}", data: pnad_mulheres_brancos }, 
                       { name: "Mulheres #{Pnad::COR.index(2)}", data: pnad_mulheres_negros  } 
                     ] if (! pnad_homens_brancos.empty? || ! pnad_mulheres_brancos.empty? || ! pnad_homens_negros.empty? || ! pnad_mulheres_negros.empty?)

      else 
        valores  = [ 1, params[:area], params[:fxid], params[:univ], 1, params[:sexo] ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_brancos = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_brancos = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end

        valores  = [ 1, params[:area], params[:fxid], params[:univ], 2, params[:sexo] ]
        valores.delete('9999') if params[:fxid] == "9999"
        # pnad_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]} * 100")

        if params[:fxid] == "9999"
          pnad_negros = Pnad.where(consulta, *valores).where(fxid).group("ano").order("ano").sum("#{params[:objetivo]}")
        else
          pnad_negros = Pnad.where(consulta, *valores).group("ano").order("ano").sum("#{params[:objetivo]}")
        end


        pnad_trata = [ { name: "#{Pnad::COR.index(1)}", data: pnad_brancos },
                       { name: "#{Pnad::COR.index(2)}", data: pnad_negros  } ] if (! pnad_brancos.empty? || ! pnad_negros.empty?)
      end

    end
	
    # yAxis: { title: { text: 'Respostas (%)' }, min: 0, max: 100 },
    config[:pnad] = {
                        library:
                               {
                                title: { text: titulo },
                                subtitle: { text: 'Dados PNAD (1992 a 2012)' },
                                yAxis: { title: { text: 'Respostas (%)' }, min: 0},
                                tooltip: { headerFormat: 'Ano: {point.key}<br/>', pointFormat: '{series.name}: <b>{point.y: .2f}%</b>' }
                               }
                       }


    pnad_trata.each do |pnad|
      pnad[:data].keep_if {|key, value| value.to_f > 0.0 } 
    end

    @dados = [ { id: "dados_pnad", type: params[:tipo_grafico], data: pnad_trata, config: config[:pnad] } ] if pnad_trata
    
    return @dados 
  end
end
