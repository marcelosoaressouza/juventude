class AgendasController < ApplicationController
  def index
    @temas = Tema.all

    if (params[:tema])
      @indicador = Tema.find(params[:tema])
    end
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
    @dados = []

    if params
      @dados = getAgendas(params)
    end

    respond_to do |format|
      format.js
    end
  end

  def getAgendas (params)
    @dados   = []
    campos_consulta = []
    valores  = []
    agenda   = []
    config   = {}
    consulta = ""
    total = 0.0

    campos_consulta = [ "tipo", "area", "sexo", "#{params[:indicador]}", "p154", "renda_ext", "escol_agreg" ]

    campos_consulta.delete('area')   if params[:area]  == '65535'
    campos_consulta.delete('sexo')   if params[:sexo]  == '65536'
    campos_consulta.delete('p154')   if params[:cor]   == '65537'
    campos_consulta.delete('renda_ext') if params[:renda] == '65538'
    campos_consulta.delete('escol_agreg') if params[:escolaridade] == '65539'

    campos_consulta.each_with_index do |col, i|
      consulta += " ( #{col} = ? ) "
      consulta += " AND " if ! campos_consulta.to_a[i+1].nil?
    end
 
#    if params[:cor] =~ /,/ || params[:sexo] =~ /,/
      fxid  =  params[:fxid].split(',')
      area  =  params[:area].split(',')
      sexo  =  params[:sexo].split(',')
      renda = params[:renda].split(',')
      escolaridade = params[:escolaridade].split(',')
      cor   = params[:cor].split(',')

      logger.debug("-------------------------------------------------------------------------------------------------")
      logger.debug("* FXID #{fxid} AREA #{area} SEXO #{sexo} RENDA #{renda} ESCOLARIDADE #{escolaridade} COR #{cor} *")
      logger.debug("-------------------------------------------------------------------------------------------------")

      fxid.each_with_index do |f, i1|
        area.each_with_index do |a, i2|
          sexo.each_with_index do |s, i3|
            renda.each_with_index do |r, i4|
              escolaridade.each_with_index do |e, i5|
                cor.each_with_index do |c, i6|
                  Agenda::INDICADOR[params[:indicador]]["Respostas"].each do |indicador|
                    logger.debug("... Contando F: #{f} A: #{a} S: #{s} R: #{r} E: #{e} C: #{c} e indicador #{indicador[0]}")

                    fc = "idade1 BETWEEN 15 AND 17" if f == "1517"
                    fc = "idade1 BETWEEN 18 AND 24" if f == "1824"
                    fc = "idade1 BETWEEN 25 AND 29" if f == "2529"

                    valores = [ 1, a, s, indicador[0], c, r, e ]

                    valores.delete('65535') if params[:area] == '65535'
                    valores.delete('65536') if params[:sexo] == '65536'
                    valores.delete('65537') if params[:cor]  == '65537'
                    valores.delete('65538') if params[:renda]  == '65538'
                    valores.delete('65539') if params[:escolaridade]  == '65539'

                    logger.debug("* FXID #{f}")

                    if f != '65534'
                      dados_agenda = Agenda.where(consulta, *valores).where(fc).group("#{params[:indicador]}").sum(params[:indicador])
                    else
                      dados_agenda = Agenda.where(consulta, *valores).group("#{params[:indicador]}").sum(params[:indicador])
                    end

                    label = "#{indicador[1]}"
                    label = label + " - #{Agenda::FXID.index(f.to_i)}" if fxid.size > 1
                    label = label + " - #{Agenda::AREA.index(a.to_i)}" if area.size > 1
                    label = label + " - #{Agenda::SEXO.index(s.to_i)}" if sexo.size > 1
                    label = label + " - #{Agenda::ESCOLARIDADE.index(e.to_i)}" if escolaridade.size > 1
                    label = label + " - #{Agenda::RENDA.index(r.to_i)}" if renda.size > 1
                    label = label + " - #{Agenda::COR.index(c.to_i)}"   if cor.size > 1

                    logger.debug("* Dados #{dados_agenda}")

                    agenda << { name: "#{label}", data: dados_agenda } if ! dados_agenda.empty?

                  end
                end
              end
            end
          end
        end
      end
#    else  

    agenda.each do |a|
      total += a[:data].values.sum
    end

    agenda.each do |a|
      a[:data].each do |key,value|
        value = value * 100 / total
        a[:data][key] = value
      end
    end

    # titulo = "#{Agenda::INDICADOR[params[:indicador]]["Questão"]} - #{Agenda::FXID.index(params[:fxid].to_i)} - #{Agenda::AREA.index(params[:area].to_i)} - #{Agenda::SEXO.index(params[:sexo].to_i)} - #{Agenda::COR.index(params[:cor].to_i)} - #{Agenda::RENDA.index(params[:renda].to_i)} - #{Agenda::ESCOLARIDADE.index(params[:escolaridade].to_i)} <br/>Total de #{total.floor} Respostas"

    titulo = "#{Agenda::INDICADOR[params[:indicador]]["Questão"]}<br/>#{total.floor} Respostas"

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

#    end

    return @dados 
  end
end
