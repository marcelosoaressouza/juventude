class Pnad < ActiveRecord::Base
  attr_accessible :acamados, :acidente, :afaz20, :agua, :aguaesco, :aguaescolixo, :alim, :analf, :ano, :area, :cb, :celpess, :chefeconj, :cm, :codigo, :conflito, :conflitosol, :cor, :cprop, :cronica, :dens, :dentista, :dese, :deseano, :desemes, :desloc1, :dvd, :ebia, :educa, :empdom, :esco, :esporte, :esporte2, :extpob, :famconviv, :filho, :freq, :freqcomppos, :freqcompsup, :freqfund, :freqfund1, :freqfund2, :freqmed, :freqmed2, :freqprof, :freqprof2, :freqprof3, :fuma, :fuma15, :fuma18, :fumadia, :fumardoenca, :fxid, :idtrab15, :idtrab18, :informal, :jatrab, :jornada30, :jornada40, :jornadanot, :lixo, :luz, :mcp, :mcpint, :medico, :mobilidade, :moto, :mudar, :naofumamais, :naoquerparar, :ncompfund1, :ncompfund2, :ncompmed, :ncompsup, :nestnpea, :nestnpeanafaz, :nestnpeanfil, :nestnpeanfilnafaz, :nestntrab, :nestntrabnafaz, :nestntrabnfil, :nfcompfund1n2, :nfcompfundnfm, :nfcompmednfs, :nfezativ, :nfncompfund1, :nfncompfund2, :nfncompmed, :nfreq, :nocup, :npea, :nsolteiro, :nuncafumou, :nvontadeprop, :ocup, :ocup2anos, :ocupano, :ocupano2, :outropar, :outrotrab, :outtrabocup, :outtrabocup2, :pc2, :pea, :planosaude, :pob, :procatend, :proctrabocup, :recebatend, :sal1, :sal2, :saudebom, :scardom, :seg, :segbairro, :segcasa, :segcid, :sexo, :sind, :tel, :telc, :tentouparar, :termfund, :termmed, :termsup, :tfn, :tipo, :trabnrem, :tv, :tv2, :tvrad, :univ, :utilint3, :v0102, :violencia, :vitima, :vitimapoli, :vivfilest, :vivfilestaf, :vivfilnest, :vivfilnestaf, :vivfilnocup, :vivfilnocupaf, :vivfilnocupnest, :vivfilnocupnestaf, :vivfilocup, :vivfilocupaf, :vivfilocupest, :vivfilocupestaf

  FONTE = { "PNAD" => 0 }

  FXID = { "De 15 a 24 Anos" => 1524, "De 15 a 29 Anos" => 1529, "De 18 a 29 Anos" => 1829, "De 15 a 17 Anos" => 1517,
           "De 18 a 21 Anos" => 1821, "De 18 a 24 Anos" => 1824, "De 25 a 29 Anos" => 2529 }

  UNIV = { "Brasil" => 0, "Região Norte" => 10, "Região Nordeste" => 20, "Região Sudeste" => 30, "Regiao Sul" => 40,
           "Regiao Centro Oeste" => 49, "Acre" => 12, "Alagoas" => 27, "Amapá" => 16, "Amazonas" => 13, "Bahia" => 29,
           "Ceará" => 23, "Distrito Federal" => 53, "Espirito Santo" => 32, "Goiás" => 52, "Maranhão" => 21,
           "Mato Grosso" => 51, "Mato Grosso do Sul" => 50, "Minas Gerais" => 31, "Pará" => 15, "Paraíba" => 25,
           "Paraná" => 41, "Pernambuco" => 26, "Piauí" => 22, "Rio de Janeiro" => 33, "Rio Grande do Norte" => 24,
           "Rio Grande do Sul" => 43, "Rondônia" => 11, "Roraima" => 14, "Santa Catarina" => 42, "São Paulo" => 35,
           "Sergipe" => 28, "Tocantins" => 17 }

  TIPO = { "Porcentagem" => 1, "Absoluto" => 2 }
  AREA = { "Total" => 0, "Urbana" => 1, "Rural" => 2 }
  SEXO = { "Total" => 0, "Homens" => 1, "Mulheres" => 2, "Homens e Mulheres" => 3 }
  COR  = { "Total" => 0, "Branco(a)s ou Amarelo(a)s" => 1, "Negro(a)s" => 2, "Branco(a)s e Amarelo(a)s ou Negro(a)s" => 3 }

  TIPO_GRAFICO = { "Linha" => "line", "Barra" => "bar", "Coluna" => "column" , "Área" => 'area', "Torta" => 'pie'}

  # GRUPO = { "Ano" => "ano", "Sexo" => "sexo", "Cor" => "cor" }
  GRUPO = { "Ano" => "ano" }

  OBJETIVO = {
              "Taxa de analfabetismo" => "analf",
              "Média de anos de estudo dos jovens (em anos de estudo)" => "educa",
              "Porcentagem de jovens que frequentam a escola" => "freq",
              "Porcentagem de jovens não frequentam a escola" => "nfreq",
              "Porcentagem de jovens que frequentam o ensino fundamental" => "freqfund",
              "Porcentagem de jovens que frequentam os anos iniciais do ensino fundamental" => "freqfund1",
              "Porcentagem de jovens que frequentam os anos finais do ensino fundamental" => "freqfund2",
              "Porcentagem de jovens que ainda não completaram as séries iniciais do ensino fundamental" => "ncompfund1",
              "Porcentagem de jovens que ainda não completaram as séries finais do ensino fundamental" => "ncompfund2",
              "Porcentagem de jovens que não estudam, nem completaram os anos iniciais do ensino fundamental" => "nfncompfund1",
              "Porcentagem de jovens que não estudam, completaram os anos iniciais do ensino fundamental, mas não frequentaram os anos finais" => "nfncompfund2",
              "Porcentagem de jovens que não estudam, frequentaram os anos finais do fundamental, mas não completaram o ensino fundamental" => "nfcompfund1n2",
              "Porcentagem de jovens que não estudam, completaram o fundamental, mas nunca frequentaram o ensino médio" => "nfcompfundnfm",
              "Porcentagem de jovens que frequentam o ensino médio" => "freqmed",
              "Porcentagem de jovens que frequentam ou já concluíram o ensino médio" => "freqmed2",
              "Porcentagem de jovens que ainda não completaram o ensino médio" => "ncompmed",
              "Porcentagem de jovens que não estudam, frequentaram, mas não completaram o ensino médio" => "nfncompmed",
              "Porcentagem de jovens que não estudam, completaram o ensino médio, mas nunca frequentaram o ensino superior" => "nfcompmednfs",
              "Porcentagem de jovens que frequentam curso de educação profissional" => "freqprof",
              "Porcentagem de jovens que frequentam curso de educação profissional dentre os que frequentam a escola" => "freqprof2",
              "Porcentagem de jovens que frequentam ou já frequentaram curso de educação profissional" => "freqprof3",
              "Porcentagem de jovens que frequentam ou já completaram o ensino superior" => "freqcompsup",
              "Porcentagem de jovens que frequentam ou já concluíram o mestrado ou o doutorado" => "freqcomppos",
              "Porcentagem de jovens que ainda não completaram o ensino superior" => "ncompsup"
  }
end
