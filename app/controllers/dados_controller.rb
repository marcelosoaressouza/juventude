class DadosController < ApplicationController
  FXID = { :DE_15_A_29_ANOS => 1529, :DE_15_A_24_ANOS => 1524, :DE_18_A_29_ANOS => 1829, :DE_15_A_17_ANOS => 1517,
           :DE_18_A_21_ANOS => 1821, :DE_18_A_24_ANOS => 1824, :DE_25_A_29_ANOS => 2529 } 

  UNIV = { :BRASIL => 0, :REGIAO_NORTE => 10, :REGIAO_NORDESTE => 20, :REGIAO_SUDESTE => 30, :REGIAO_SUL => 40,
           :REGIAO_CENTRO_OESTE => 49, :ACRE => 12, :ALAGOAS => 27, :AMAPA => 16, :AMAZONAS => 13, :BAHIA => 29,
           :CEARA => 23, :DISTRITO_FEDERAL => 53, :ESPIRITO_SANTO => 32, :GOIAS => 52, :MARANHAO => 21,
           :MATO_GROSSO => 51, :MATO_GROSSO_DO_SUL => 50, :MINAS_GERAIS => 31, :PARA => 15, :PARAIBA => 25,
           :PARANA => 41, :PERNAMBUCO => 26, :PIAUI => 22, :RIO_DE_JANEIRO => 33, :RIO_GRANDE_DO_NORTE => 24,
           :RIO_GRANDE_DO_SUL => 43, :RONDONIA => 11, :RORAIMA => 14, :SANTA_CATARINA => 42, :SAO_PAULO => 35,
           :SERGIPE => 28, :TOCANTINS => 17 }

  TIPO = { :PORCENTAGEM => 1, :ABSOLUTO => 2 }
  AREA = { :TOTAL => 0, :URBANA => 1, :RURAL    => 2 }
  SEXO = { :TOTAL => "Total", :HOMENS => "Homem", :MULHERES => "Mulher" }
  COR  = { :TOTAL => "Total", :BRANCOS_OU_AMARELOS => "Brancos ou Amarelos", :NEGROS => "Negros"}

  def show
    @config = {}

    if  params[:type] == 'one'
      @sexo_15_a_29  = Dado.where("cor = ? AND fxid = ? AND univ = ? AND tipo = ? AND area = ? AND (sexo = ? OR sexo = ?)",
                                   COR[:TOTAL], FXID[:DE_15_A_29_ANOS], UNIV[:BRASIL], TIPO[:ABSOLUTO], AREA[:TOTAL], SEXO[:HOMENS], SEXO[:MULHERES])
                           .group(:sexo).count

      @config[:sexo_de_15_a_29] = { library: { title: { text: "Geral Homens/Mulheres 15 a 29 Anos" }, 
                                               plotOptions: { pie: { showInLegend: true, dataLabels: { enabled: true, format: '{point.name}: <b>{point.percentage:.2f}%</b>' } } }, 
                                               tooltip: { pointFormat: 'Total: <b>{point.y}</b>' }, 
                                               series: [{ name: 'Browser share'}] 
                                             }
                                  }
      @dados = [ { id: 'DE_15_A_29_ANOS', type: 'pie',  data: @sexo_15_a_29,  config: @config[:sexo_de_15_a_29]  } ]

    elsif  params[:type] == 'two'

      @sexo_15_a_24  = Dado.where("cor = ? AND fxid = ? AND univ = ? AND tipo = ? AND area = ? AND (sexo = ? OR sexo = ?)",
                                   COR[:TOTAL], FXID[:DE_15_A_24_ANOS], UNIV[:BRASIL], TIPO[:ABSOLUTO], AREA[:TOTAL], SEXO[:HOMENS], SEXO[:MULHERES])
                           .group(:sexo).count

      @config[:sexo_de_15_a_24] = { library: { title: { text: "Geral Homens/Mulheres 15 a 24 Anos" }, 
                                               plotOptions: { pie: { showInLegend: true, dataLabels: { enabled: true, format: '{point.name}: <b>{point.percentage:.2f}%</b>' } } }, 
                                               tooltip: { pointFormat: 'Total: <b>{point.y}</b>' }, 
                                               series: [{ name: 'Browser share'}] 
                                             }
                                  }
      @dados = [ { id: 'DE_15_A_24_ANOS', type: 'pie',  data: @sexo_15_a_24,  config: @config[:sexo_de_15_a_24]  } ]

    elsif  params[:type] == 'three'

      @generic  = Dado.where("codigo SIMILAR TO ?", "%0_0_(1|2)_0_2%").group(:sexo).count

      @config[:generic] = { library: { title: { text: "Generic" }, 
                                               plotOptions: { pie: { showInLegend: true, dataLabels: { enabled: true, format: '{point.name}: <b>{point.percentage:.2f}%</b>' } } }, 
                                               tooltip: { pointFormat: 'Total: <b>{point.y}</b>' }, 
                                               series: [{ name: 'Browser share'}] 
                                             }
                                  }
      @dados = [ { id: 'Generic', type: 'pie',  data: @generic,  config: @config[:generic]  } ]
    else
      @dados = []
    end

    respond_to do |format|
      format.js
    end
  end

  def index

    @config = {}

    # Escolaridade 15 a 24

    @educa_homem_15_a_24 = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                               TIPO[:PORCENTAGEM], AREA[:TOTAL], FXID[:DE_15_A_24_ANOS], COR[:TOTAL], SEXO[:HOMENS])
                       .group(:ano).sum(:educa)

    @educa_mulher_15_a_24 = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                               TIPO[:PORCENTAGEM], AREA[:TOTAL], FXID[:DE_15_A_24_ANOS], COR[:TOTAL], SEXO[:MULHERES])
                       .group(:ano).sum(:educa)

    @educa_15_a_24 = [ { name: 'Homens', data: @educa_homem_15_a_24 }, { name: 'Mulheres', data: @educa_mulher_15_a_24 } ]


    @config[:educa_de_15_a_24] = { library: { title: { text: "Escolaridade Homem/Mulher - 15 a 24 Anos" }, 
                                  tooltip: { valueSuffix: '%',
                                             pointFormat: '{series.name}: <b>{point.y: .2f}</b>'
                                           } 
                                  }
              }

    # Escolaridade 15 a 29

    @educa_homem_15_a_29 = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                               TIPO[:PORCENTAGEM], AREA[:TOTAL], FXID[:DE_15_A_29_ANOS], COR[:TOTAL], SEXO[:HOMENS])
                       .group(:ano).sum(:educa)

    @educa_mulher_15_a_29 = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                               TIPO[:PORCENTAGEM], AREA[:TOTAL], FXID[:DE_15_A_29_ANOS], COR[:TOTAL], SEXO[:MULHERES])
                       .group(:ano).sum(:educa)

    @educa_15_a_29 = [ { name: 'Homens', data: @educa_homem_15_a_29 }, { name: 'Mulheres', data: @educa_mulher_15_a_29 } ]


    @config[:educa_de_15_a_29] = { library: { title: { text: "Escolaridade Homem/Mulher - 15 a 29 Anos" }, 
                                  tooltip: { valueSuffix: '%',
                                             pointFormat: '{series.name}: <b>{point.y: .2f}</b>'
                                           } 
                                  }
              }

    @dados = [
               { id: 'DE_15_A_24_ANOS', type: 'line', data: @educa_15_a_24, config: @config[:educa_de_15_a_24] },
               { id: 'DE_15_A_29_ANOS', type: 'line', data: @educa_15_a_29, config: @config[:educa_de_15_a_29] }
             ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados }
    end
  end
end
