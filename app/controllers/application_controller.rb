class ApplicationController < ActionController::Base
  protect_from_forgery

  #
  # Dados da Agenda da Juventude
  #
  def getAgendas (params)
    @dados   = []
    campos_consulta = []
    valores  = []
    agenda   = []
    config   = {}
    consulta = ""
    total = 0.0
  
    campos_consulta = [ "tipo", "area", "sexo", "#{params[:indicador]}", "p154", "rendaf" ]

    campos_consulta.delete('area') if params[:area]    == '65535'
    campos_consulta.delete('sexo') if params[:sexo]    == '65536'
    campos_consulta.delete('p154') if params[:cor]     == '65537'
    campos_consulta.delete('rendaf') if params[:renda] == '65538'

    campos_consulta.each_with_index do |col, i|
      consulta += " ( #{col} = ? ) "
      consulta += " AND " if ! campos_consulta.to_a[i+1].nil?
    end

    fxid = "idade1 BETWEEN 15 AND 17" if params[:fxid] == "1517"
    fxid = "idade1 BETWEEN 18 AND 24" if params[:fxid] == "1824"
    fxid = "idade1 BETWEEN 25 AND 29" if params[:fxid] == "2529"

    # fxid = "idade1 BETWEEN 15 AND 24" if params[:fxid] == "1524"
    # fxid = "idade1 BETWEEN 15 AND 29" if params[:fxid] == "1529"
    # fxid = "idade1 BETWEEN 18 AND 29" if params[:fxid] == "1829"
    # fxid = "idade1 BETWEEN 18 AND 21" if params[:fxid] == "1821"

    Agenda::INDICADOR[params[:indicador]]["Respostas"].each do |indicador| 
      valores = [ 1, params[:area], params[:sexo], indicador[0], params[:cor], params[:renda] ]

      valores.delete('65535') if params[:area] == '65535'
      valores.delete('65536') if params[:sexo] == '65536'
      valores.delete('65537') if params[:cor]  == '65537'
      valores.delete('65538') if params[:renda]  == '65538'

      if params[:fxid] != '65534'
        dados_agenda = Agenda.where(consulta, *valores)
                             .where(fxid)
                             .group("#{params[:indicador]}")
                             .sum(params[:indicador])
      else
        dados_agenda = Agenda.where(consulta, *valores)
                             .group("#{params[:indicador]}")
                             .sum(params[:indicador])
      end
      logger.debug("--==>> #{dados_agenda} #{indicador[0]}")

      agenda << { name: "#{indicador[1]} (#{dados_agenda[indicador[0].to_i]})", data: dados_agenda } if ! dados_agenda.empty?
    end

    agenda.each do |a|
      total += a[:data].values.sum
    end

    agenda.each do |a|
      a[:data].each do |key,value|
        value = value * 100 / total
        a[:data][key] = value
      end
    end

    titulo = "#{Agenda::INDICADOR[params[:indicador]]["Questão"]} - #{Agenda::FXID.index(params[:fxid].to_i)} - #{Agenda::AREA.index(params[:area].to_i)} - #{Agenda::SEXO.index(params[:sexo].to_i)} - #{Agenda::COR.index(params[:cor].to_i)} <br/>Total de #{total.floor} Respostas"

    config[:agenda] = {
                        library:
                               {
                                title: { text: titulo },
                                subtitle: { text: 'Agenda da Juventude' },
                                xAxis: { title: { text: 'Respostas (%)' }, labels: { enabled: false } },
                                yAxis: { min: 0, max: 100 },
                                tooltip: { headerFormat: '{series.name}: ', pointFormat: '<b>{point.y: .2f}%</b>' }
                               }
                       }

    @dados = [ { id: "dados_agenda", type: params[:tipo_grafico], data: agenda, config: config[:agenda] } ] if agenda
    @dados = [] if total.to_f == 0.0
    
    return @dados 
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
