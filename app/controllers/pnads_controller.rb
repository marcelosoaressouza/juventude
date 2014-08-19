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

  def getPnads (params)
    @dados  = []
    pnad    = []
    config  = {}
    consulta = ""

    # valores = []
    # pnad_trata = []
    # pnad_bruto = {}
  
    cons = [ "tipo", "area", "univ", "cor", "sexo" ]

    cons.each_with_index do |col, i|
      consulta += " #{col} = ?"
      consulta += " AND " if ! cons.to_a[i+1].nil?
    end

    area = params[:area].split(',')
    fxid = params[:fxid].split(',')
    univ = params[:univ].split(',')
    cor  = params[:cor].split(',')
    sexo = params[:sexo].split(',')

    logger.debug("------------------------------------------------------------------")
    logger.debug("* AREA #{area} FXID #{fxid} UNIV #{univ} COR #{cor} SEXO #{sexo} *")
    logger.debug("------------------------------------------------------------------")

    area.each_with_index do |a, i1|
      fxid.each_with_index do |f, i2|
        univ.each_with_index do |u, i3|
          cor.each_with_index do |c, i4|
            sexo.each_with_index do |s, i5|
              fc = " fxid IN ('1517', '1824', '2529') " if f == '9999'
              fc = " fxid IN ('1517') " if f == '1517'
              fc = " fxid IN ('1824') " if f == '1824'
              fc = " fxid IN ('2529') " if f == '2529'

              valores = [ 1, a, u, c, s ]

              dados_pnad = Pnad.where(consulta, *valores).where(fc).group("ano").order("ano").sum("#{params[:objetivo]} * 10")

              label = "#{Pnad::OBJETIVO.index(params[:objetivo])}"
              label = label + " - #{Pnad::FXID.index(f.to_i)}" if fxid.size > 1
              label = label + " - #{Pnad::AREA.index(a.to_i)}" if area.size > 1
              label = label + " - #{Pnad::SEXO.index(s.to_i)}" if sexo.size > 1
              label = label + " - #{Pnad::COR.index(c.to_i)}"  if cor.size  > 1

              pnad << { name: "#{label}", data: dados_pnad } if ! dados_pnad.empty?

            end
          end
        end
      end
    end

    # yAxis: { title: { text: 'Respostas (%)' }, min: 0, max: 100 },

    # titulo = "#{Pnad::OBJETIVO.index(params[:objetivo])} - #{Pnad::FXID.index(params[:fxid].to_i)} - #{Pnad::AREA.index(params[:area].to_i)} - #{Pnad::SEXO.index(params[:sexo].to_i)} - #{Pnad::COR.index(params[:cor].to_i)}"
    
    titulo = "#{Pnad::OBJETIVO.index(params[:objetivo])}"

    config[:pnad] = {
                        library:
                               {
                                title: { text: titulo },
                                subtitle: { text: 'Dados PNAD (1992 a 2012)' },
                                yAxis: { title: { text: 'Respostas (%)' }, min: 0},
                                tooltip: { headerFormat: 'Ano: {point.key}<br/>', pointFormat: '{series.name}: <b>{point.y: .2f}%</b>' }
                               }
                       }


    pnad.each do |pnad|
      pnad[:data].keep_if {|key, value| value.to_f > 0.0 } 
    end

    @dados = [ { id: "dados_pnad", type: params[:tipo_grafico], data: pnad, config: config[:pnad] } ] if pnad
    
    return @dados 
  end
end
