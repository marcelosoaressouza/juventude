class Filtro < ActiveRecord::Base
  attr_accessible :area, :cor, :fxid, :grupo, :objetivo, :sexo, :tipo, :tipo_grafico, :titulo, :univ

  FXID = { "DE_15_A_29_ANOS" => 1529, "DE_15_A_24_ANOS" => 1524, "DE_18_A_29_ANOS" => 1829, "DE_15_A_17_ANOS" => 1517,
           "DE_18_A_21_ANOS" => 1821, "DE_18_A_24_ANOS" => 1824, "DE_25_A_29_ANOS" => 2529 }

  UNIV = { "BRASIL" => 0, "REGIAO_NORTE" => 10, "REGIAO_NORDESTE" => 20, "REGIAO_SUDESTE" => 30, "REGIAO_SUL" => 40,
           "REGIAO_CENTRO_OESTE" => 49, "ACRE" => 12, "ALAGOAS" => 27, "AMAPA" => 16, "AMAZONAS" => 13, "BAHIA" => 29,
           "CEARA" => 23, "DISTRITO_FEDERAL" => 53, "ESPIRITO_SANTO" => 32, "GOIAS" => 52, "MARANHAO" => 21,
           "MATO_GROSSO" => 51, "MATO_GROSSO_DO_SUL" => 50, "MINAS_GERAIS" => 31, "PARA" => 15, "PARAIBA" => 25,
           "PARANA" => 41, "PERNAMBUCO" => 26, "PIAUI" => 22, "RIO_DE_JANEIRO" => 33, "RIO_GRANDE_DO_NORTE" => 24,
           "RIO_GRANDE_DO_SUL" => 43, "RONDONIA" => 11, "RORAIMA" => 14, "SANTA_CATARINA" => 42, "SAO_PAULO" => 35,
           "SERGIPE" => 28, "TOCANTINS" => 17 }

  TIPO = { "PORCENTAGEM" => 1, "ABSOLUTO" => 2 }
  AREA = { "TOTAL" => 0, "URBANA" => 1, "RURAL" => 2 }
  SEXO = { "TOTAL" => 0, "HOMENS" => 1, "MULHERES" => 2 }
  COR  = { "TOTAL" => 0, "BRANCOS_OU_AMARELOS" => 1, "NEGROS" => 2 }

  TIPO_GRAFICO = { "LINHA" => "line" }
  GRUPO = { "ANO" => "ano" }
  OBJETIVO = { "EDUCAÇÃO" => "educa" }

end
