class DadosController < ApplicationController
  def index
    @sexo  = Dado.where("tipo = ? AND area = ? AND (sexo = ? OR sexo = ?)", 2, 1, 'Homem', 'Mulher').group(:sexo).count
    @educa_homem = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?", 1, 1, 1517, 'Negros', 'Homem').group(:ano).sum(:educa)
    @educa_mulher = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?", 1, 1, 1517, 'Negros', 'Mulher').group(:ano).sum(:educa)
    @educa = [ { name: 'Homem', data: @educa_homem }, { name: 'Mulher', data: @educa_mulher } ]

    @config = {}

    @config[:pie] = { library: { title: { text: "Quantidade Homem/Mulher" }, 
                                 plotOptions: { pie: { showInLegend: true,
                                                       dataLabels: { enabled: true, format: '{point.name}: <b>{point.percentage:.2f}%</b>' }
                                                      }
                                              }, 
                                 tooltip: {
                                            pointFormat: 'Total: <b>{point.y}</b>'
                                          }, 
                                 series: [{ name: 'Browser share'}] 
                               }
                    }

    @config[:line] = { library: { title: { text: "Escolaridade Homem/Mulher - 1992 a 2012" }, 
                                  tooltip: { valueSuffix: '%',
                                             pointFormat: '{series.name}: <b>{point.y: .2f}</b>'
                                           } 
                                  }
              }

    @dados = [ { pie: @sexo }, { line: @educa } ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados }
    end
  end
end
