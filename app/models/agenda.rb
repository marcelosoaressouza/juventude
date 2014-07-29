class Agenda < ActiveRecord::Base
  attr_accessible :area, :chefe_fam, :conjugal, :cor_agreg, :defasa, :escol_agreg, :escol_agreg2, :est_ab, :estado, :faixa_agrer2, :faixa_etaria_agreg, :filho_nat, :fxid, :genero_idade, :genero_raca, :idade1, :info_agreg, :mundo_id, :net_agreg, :nquest, :p1, :p100aa, :p100ab, :p100ac, :p100ad, :p100ae, :p100af, :p100ag, :p100ah, :p100ai, :p100aj, :p100ba, :p100bb, :p100bc, :p100bd, :p100be, :p100bf, :p100bg, :p100bh, :p100bi, :p100bj, :p100ca, :p100cb, :p100cc, :p100cd, :p100ce, :p100cf, :p100cg, :p100ch, :p100ci, :p100cj, :p100da, :p100db, :p100dc, :p100dd, :p100de, :p100df, :p100dg, :p100dh, :p100di, :p100dj, :p101, :p102, :p103, :p104a, :p104b, :p104c, :p104d, :p104e, :p104f, :p105, :p106a, :p106b, :p107ano, :p107dia, :p107mes, :p108a, :p108b, :p108c, :p109a, :p109b, :p109c, :p109d, :p109e, :p109f, :p10a, :p10b, :p10ba_1, :p10ba_2, :p10ba_3, :p10ba_4, :p10bb_1, :p10bb_2, :p10bb_3, :p10bb_4, :p10bc_1, :p10bc_2, :p10bc_3, :p10bc_4, :p10bd_1, :p10bd_2, :p10bd_3, :p10bd_4, :p10be_1, :p10be_2, :p10be_3, :p10be_4, :p10bf_1, :p10bf_2, :p10bf_3, :p10bf_4, :p10bg_1, :p10bg_2, :p10bg_3, :p10bg_4, :p10bh_1, :p10bh_2, :p10bh_3, :p10bh_4, :p10c, :p10d, :p10e, :p10f, :p10g, :p10h, :p110, :p111, :p111a, :p112, :p113a, :p113b, :p113c, :p113d, :p113e, :p113f, :p114, :p114ado, :p114ent, :p114nat, :p115a, :p115b, :p115c, :p115d, :p115e, :p115f, :p116a, :p116b, :p117a, :p117b, :p117c, :p117d, :p118, :p119a, :p119b, :p119c, :p119d, :p119e, :p119f, :p11aa, :p11ab, :p11ac, :p11ad, :p11ae, :p11af, :p11ba, :p11bb, :p11bc, :p11bd, :p11be, :p11bf, :p12, :p120, :p121, :p122, :p123aa, :p123ab, :p123ac, :p123ad, :p123ae, :p123af, :p123ba, :p123bb, :p123bc, :p123bd, :p123be, :p123bf, :p124a, :p124c, :p124d, :p124e, :p124f, :p124g, :p124j, :p124l, :p124m, :p124n, :p124o, :p124p, :p124q, :p124r, :p124s, :p124t, :p124u, :p125a, :p125b, :p125c, :p125d, :p125e, :p125f, :p126, :p127a, :p127b, :p127c, :p128, :p129, :p130a, :p130b, :p130c, :p130d, :p130e, :p130f, :p130g, :p130h, :p130i, :p130j, :p130k, :p130l, :p130m, :p130n, :p130o, :p131, :p132a, :p132b, :p132c, :p132d, :p132e, :p132f, :p132g, :p132h, :p133a, :p133b, :p133c, :p133d, :p133e, :p133f, :p133g, :p133h, :p133i, :p133j, :p134aa, :p134ab, :p134ac, :p134ad, :p134ae, :p134af, :p134b, :p134ca, :p134cb, :p134cc, :p134cd, :p134ce, :p134cf, :p134da, :p134db, :p134dc, :p134dd, :p134de, :p134df, :p134ea, :p134eb, :p134ec, :p134ed, :p134ee, :p134ef, :p134fa, :p134fb, :p134fc, :p134fd, :p134fe, :p134ff, :p135, :p136a, :p136b, :p137a, :p137b, :p138a, :p138b, :p139a, :p139b, :p13a, :p13b, :p13c, :p13d, :p13e, :p13f, :p140a, :p140b, :p141a, :p141b, :p142a, :p142anos, :p142b, :p142dia, :p143, :p144, :p145, :p145a, :p145b, :p145c, :p146, :p146a, :p147a, :p147b, :p147c, :p148, :p148a, :p149a, :p149b, :p14a, :p14b, :p14c, :p14d, :p150a, :p150b, :p150c, :p151a, :p151b, :p151c, :p152a_x, :p152a_y, :p153, :p153_154x, :p154, :p155, :p156aa, :p156ab, :p156ba, :p156bb, :p158a, :p158b, :p158c, :p158d, :p158e, :p158f, :p159a, :p159b, :p159c, :p15a, :p15b, :p15c, :p15d, :p15e, :p15f, :p160, :p16a, :p16b, :p16c, :p16d, :p16e, :p16f, :p16g, :p16h, :p16i, :p16j, :p17a, :p17b, :p18aa, :p18ab, :p18ba, :p18bb, :p18ca, :p18cb, :p19aa, :p19ab, :p19ac, :p19ba, :p19bb, :p19bc, :p19ca, :p19cb, :p19cc, :p1a, :p1b, :p2, :p20, :p21a, :p21b, :p21c, :p22a, :p22b, :p22c, :p22d, :p22e, :p22f, :p22g, :p22h, :p22i, :p22j, :p22k, :p23a, :p23b, :p23c, :p24a, :p24b, :p24c, :p25, :p26, :p27a, :p27b, :p27ca, :p27cb, :p27cc, :p27cd, :p27ce, :p27cf, :p28a, :p28b, :p28c, :p28d, :p28e, :p28f, :p28g, :p28h, :p28i, :p28j, :p28k, :p28l, :p28m, :p28n, :p28o, :p29a, :p29b, :p29c, :p29d, :p29e, :p29f, :p29g, :p29h, :p29i, :p29j, :p29k, :p29l, :p29m, :p29n, :p29o, :p2ano, :p2b, :p2mes, :p3, :p30a, :p30b, :p30c, :p30d, :p30e, :p30f, :p30g, :p30h, :p30i, :p30j, :p30k, :p30l, :p30m, :p30n, :p30o, :p31a, :p31b, :p31c, :p31d, :p31e, :p31f, :p31g, :p31h, :p31i, :p31j, :p31k, :p31l, :p31m, :p31n, :p31o, :p32, :p32a, :p33a, :p33b, :p33c, :p33d, :p33e, :p33f, :p33g, :p34, :p35a, :p35ba, :p35bb, :p35bc, :p35ca, :p35cb, :p35cc, :p36a, :p36b, :p36c, :p37, :p38aa, :p38ab, :p38ac, :p38ba, :p38bb, :p38bc, :p39, :p40, :p41, :p42a, :p42b, :p42c, :p42d, :p42e, :p42f, :p43, :p43a, :p44ab, :p45ab, :p46a, :p46b, :p46c, :p46d, :p46e, :p46f, :p47, :p47a, :p47b, :p47c, :p47d, :p47e, :p47f, :p47g, :p48ab, :p49a, :p49ba, :p49bb, :p49bc, :p49bd, :p49be, :p49bf, :p4a, :p4b, :p4c, :p4d, :p4e, :p4f, :p4g, :p4h, :p4i, :p4j, :p5, :p50, :p51, :p52a, :p52b, :p52c, :p52d, :p52e, :p52f, :p53a, :p53b, :p53c, :p53d, :p53e, :p54a, :p54b, :p54c, :p54d, :p54e, :p54f, :p54g, :p54h, :p54i, :p54j, :p55, :p56a, :p56b, :p56c, :p57a, :p57b, :p57c, :p57d, :p57e, :p57f, :p57g, :p57h, :p57i, :p57j, :p58aa, :p58ab, :p58ac, :p58ad, :p58ae, :p58af, :p58ba, :p58bb, :p58bc, :p58bd, :p58be, :p58bf, :p58ca, :p58cb, :p58cc, :p58cd, :p58ce, :p58cf, :p59aa, :p59ab, :p59ba, :p59bb, :p59ca, :p59cb, :p59da, :p59db, :p60, :p61, :p62a, :p62b, :p63, :p64, :p65, :p66, :p67, :p68ano, :p68mes, :p69a, :p69b, :p69c, :p69d, :p69e, :p69f, :p69g, :p69h, :p6a, :p6b, :p6c, :p6d, :p6e, :p6f, :p6g, :p6h, :p6i, :p6j, :p70, :p70aa, :p70ab, :p70ac, :p70ad, :p70ae, :p70af, :p71, :p72aa, :p72ab, :p72ac, :p72ad, :p72ae, :p72af, :p72ag, :p72ah, :p72ai, :p72aj, :p72ba, :p72bb, :p72bc, :p72bd, :p72be, :p72bf, :p72bg, :p72bh, :p72bi, :p72bj, :p72ca, :p72cb, :p72cc, :p72cd, :p72ce, :p72cf, :p72cg, :p73, :p74a, :p74b, :p74c, :p74d, :p74e, :p74f, :p74g, :p74h, :p74i, :p74j, :p75a, :p75b, :p75c, :p75d, :p75e, :p75f, :p75g, :p75h, :p75i, :p75j, :p76a, :p76b, :p76c, :p77a, :p77b, :p78, :p79a, :p79b, :p79c, :p79d, :p79e, :p79f, :p7a, :p7b, :p7c, :p7d, :p7e, :p7f, :p7g, :p7h, :p7i, :p7j, :p8, :p80a, :p80b, :p80c, :p80d, :p80e, :p80f, :p81, :p82a, :p82b, :p82c, :p82d, :p82e, :p82f, :p82g, :p82h, :p82i, :p82j, :p83a, :p83b, :p83c, :p84a, :p84ano, :p84dia, :p84mes, :p85, :p86, :p87, :p88b, :p88c, :p88d, :p88e, :p88f, :p88g, :p88h, :p88i, :p88j, :p88k, :p88l, :p88m, :p88n, :p88o, :p89a, :p89b, :p89c, :p89d, :p89e, :p89f, :p89g, :p89h, :p89i, :p89j, :p89k, :p89l, :p89m, :p89n, :p89o, :p90a, :p90b, :p90c, :p90d, :p90e, :p90f, :p90g, :p90h, :p90i, :p90j, :p90k, :p90l, :p90m, :p90n, :p90o, :p91a, :p91ba, :p91bb, :p91bc, :p91bd, :p91be, :p91bf, :p92a, :p92ba, :p92bb, :p92bc, :p92bd, :p92be, :p92bf, :p94, :p95, :p96, :p97a, :p97b, :p97c, :p97d, :p97e, :p97f, :p98, :p99a, :p99b, :p99c, :p99d, :p99e, :p99f, :p9a, :p9b, :p9c, :p9d, :p9e, :p9f, :partido, :peso_amostra, :peso_escola, :peso_f, :peso_sexidade, :porte1, :porte2, :ppj_agreg_2, :ppj_copy, :r107, :r117a, :r117b, :r117c, :r117d, :r153_154, :r17ab, :r2, :r28, :r68, :r84, :regioes, :reli1, :reli2, :ren_fam, :ren_ind, :renda_ext, :renda_ext_vali, :rendaf, :rendafa, :rendai, :rendaia, :rendom, :sexo, :tev_filho, :tipo, :z88

  FONTE = { "AGENDA" => 1 }

#  FXID = { "Total" => 65534, "De 15 a 17 Anos" => 1, "De 18 a 21 Anos" => 2, "De 22 a 25 Anos" => 3, "De 26 a 29 Anos" => 4 }

  FXID = { "Total" => 65534,
           "De 15 a 24 Anos" => 1524, "De 15 a 29 Anos" => 1529, "De 18 a 29 Anos" => 1829, "De 15 a 17 Anos" => 1517,
           "De 18 a 21 Anos" => 1821, "De 18 a 24 Anos" => 1824, "De 25 a 29 Anos" => 2529 }

  AREA = { "Total" => 65535, "Urbana" => 1, "Rural" => 2 }
  SEXO = { "Total" => 65536, "Homens" => 1, "Mulheres" => 2 }

  TIPO_GRAFICO = { "Coluna" => "column", "Barra" => "bar"}

  INDICADOR = {
               "p1" => { "Questão"   => "Vou precisar mostrar algumas coisas para você ler, você sabe ler?", 
                         "Respostas" => { "1" => "Sim", "2" => "Não" }
                       },
               "p1a" => { "Questão"   => "(se sabe ler) Ler qualquer palavra é uma atividade que você considera", 
                          "Respostas" => { "1" => "Fácil", "2" => "Um pouco difícil", "3" => "Bastante difícil" }
                        },
               "p1b" => { "Questão"   => "E você sabe escrever? (se sim) Escrever qualquer palavra é uma atividade que você considera:", 
                          "Respostas" => { "1" => "Fácil", "2" => "Um pouco difícil", "3" => "Bastante difícil", "4" => "Não sabe escrever" }
                        },
               "p2"  => { "Questão"   => "Você passou a maior parte da sua infância na cidade ou no campo (na roça, colônia, sertão, floresta)?", 
                          "Respostas" => { "1" => "em  cidade – PPP.3 ", "2" => "no campo (em área rural)", "3" => "Parte na cidade, parte no campo/ meio a meio....prossiga" }
                        },
               "p2b" => { "Questão"   => "Por que você mudou do campo (roça, floresta etc.) para a cidade?", 
                          "Respostas" => { "1" => "A família mudou", "2" => "Para estudar/ por causa de estudo, escola", "3" => "Para trabalhar/ buscar emprego/ trabalho", "4" => "Outras respostas" }
                        },
               "p3"  => { "Questão"   => "Vamos falar um pouco sobre as fases da vida. Você se considera:  adolescente,  jovem  ou  adulto/a?", 
                          "Respostas" => { "1" => "adolescente", "2" => "jovem", "3" => "adulto/a", "4" => "Outras identidades" }
                        },
               "p5"  => { "Questão"   => "Você diria que tem mais coisas boas ou  mais coisas ruins em ser... (repita resposta da P.3)?", 
                          "Respostas" => { "1" => "mais coisas boas", "2" => "mais coisas ruins ", "3" => "ambas/ meio a meio", "4" => "não sabe" }
                        },
               "p8"  => { "Questão"   => "Na sua opinião, o que é melhor como ... (cite resposta da P.3) ... : ser homem ou ser mulher?", 
                          "Respostas" => { "1" => "é melhor ser homem", "2" => "é melhor ser mulher", "3" => "tanto faz/ ambos/ depende/ às vezes um, às vezes outra", "4" => "Outras respostas", "5" => "não sabe" }
                        },
               "p12" => { "Questão"   => "E qual é a chance real, na sua opinião, de que isso [resposta da P.11a] aconteça? Você diria que a chance de que esse seu sonho aconteça de verdade é: (leia até a interrogação)", 
                          "Respostas" => { "1" => "grande", "2" => "media", "3" => "pequena", "4" => "nenhuma", "5" => "não sabe" }
                        },
               "p14a"=> { "Questão"   => "Independente do que você quer que aconteça, o que você acha que vai acontecer de verdade com o mundo nos próximos 5 anos:  na sua opinião o mundo vai melhorar, vai piorar ou vai ficar como está? ", 
                          "Respostas" => { "1" => "Vai melhorar", "2" => "Vai piorar", "3" => "Vai ficar como está", "4" => "Não sabe" }
                        },
               "p14b"=> { "Questão"   => "E o Brasil nos próximos 5 anos, vai melhorar, vai piorar ou vai ficar como está?", 
                          "Respostas" => { "1" => "Vai melhorar", "2" => "Vai piorar", "3" => "Vai ficar como está", "4" => "Não sabe" }
                        },
               "p14c"=> { "Questão"   => "E o seu bairro? ", 
                          "Respostas" => { "1" => "Vai melhorar", "2" => "Vai piorar", "3" => "Vai ficar como está", "4" => "Não sabe" }
                        },
               "p14d"=> { "Questão"   => "E a sua vida pessoal, como você acha que vai estar, independente do que você gostaria: você acredita que vai estar melhor, pior ou igual daqui a 5 anos? ", 
                          "Respostas" => { "1" => "Vai melhorar", "2" => "Vai piorar", "3" => "Vai ficar como está", "4" => "Não sabe" }
                        },
               "p17a"=> { "Questão"   => "Considerando esta lista (mostre CARTÃO 17), a qual dessas classes econômicas você diria que pertence:", 
                          "Respostas" => { "1" => "muito pobre", "2" => "pobre", "3" => "média baixa", "4" => "média-média", "5" => "média alta", "6" => "rica", "7" => "muito rica", "8" => "Outras respostas", "9" => "Não sabe"  }
                          # "Respostas" => { "1" => "", "2" => "", "3" => "", "4" => "", "5" => "", "6" => "", "7" => "", "8" => "", "9" => ""  }
                        },
               "p17b"=> { "Questão"   => "E a que classe econômica pertenciam seus pais ou a família que te criou, quando você era criança? (continue mostrando CARTÃO 17).", 
                          "Respostas" => { "1" => "muito pobre", "2" => "pobre", "3" => "média baixa", "4" => "média-média", "5" => "média alta", "6" => "rica", "7" => "muito rica", "8" => "Outras respostas", "9" => "Não sabe"  }                        },
               
               "p20" => { "Questão"   => "Você acha que os jovens podem mudar o mundo, ou não podem? (se sim) Muito ou um pouco?", 
                          "Respostas" => { "1" => "podem mudar muito", "2" => "podem mudar um pouco", "3" => "não podem mudar o mundo", "4" => "não sabe" }
                        },
               "p22a"=> { "Questão"   => "No Brasil existem grandes desafios que precisam ser enfrentados. Vou falar alguns deles e gostaria que você me dissesse qual é, para você, a importância de cada um: (Para cada item citado, pergunte) ...é muito importante, mais ou menos importante ou não é importante? - Melhorar saúde", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22b"=> { "Questão"   => "b. Diminuir a diferença entre ricos e pobres", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22c"=> { "Questão"   => "Fazer grander obras de infraestrutura", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22d"=> { "Questão"   => "Controlar o aumento da população", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22e"=> { "Questão"   => "Reduzir o desemprego", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22f"=> { "Questão"   => "Melhorar a educação no país", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22g"=> { "Questão"   => "Reduzir a poluição", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22h"=> { "Questão"   => "Aumentar o respeito pelos direitos humanos", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22i"=> { "Questão"   => "Reduzir o trabalho infantil", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22j"=> { "Questão"   => "Enfrentar as mudanças climáticas", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p22k"=> { "Questão"   => "Acelerar a reforma agrária", 
                          "Respostas" => { "1" => "Muito importante", "2" => "Mais ou menos importante", "3" => "Não é importante", "4" => "Não sabe" }
                        },
               "p23a"=> { "Questão"   => "Pensando no Brasil,  qual destes problemas (mostre CARTÃO 23) é que mais te incomoda hoje?", 
                          "Respostas" => { "1" => "A grande desigualdade entre ricos e pobres ", "2" => "A corrupção", "3" => "O despreparo do povo", "4" => "O poder dos traficantes", "5" => "O despreparo e a violência da polícia", "6" => "O racismo e outras formas de discriminação", "7" => "A lentidão e outros problemas da Justiça", "8" => "A destruição do meio ambiente", "9" => "A falta de perspectiva profissional para os jovens" }
                        },
               "p23b"=> { "Questão"   => "E em segundo lugar? ", 
                          "Respostas" => { "1" => "A grande desigualdade entre ricos e pobres ", "2" => "A corrupção", "3" => "O despreparo do povo", "4" => "O poder dos traficantes", "5" => "O despreparo e a violência da polícia", "6" => "O racismo e outras formas de discriminação", "7" => "A lentidão e outros problemas da Justiça", "8" => "A destruição do meio ambiente", "9" => "A falta de perspectiva profissional para os jovens" }
                        },
               "p23c"=> { "Questão"   => "e em terceiro lugar? ", 
                          "Respostas" => { "1" => "A grande desigualdade entre ricos e pobres ", "2" => "A corrupção", "3" => "O despreparo do povo", "4" => "O poder dos traficantes", "5" => "O despreparo e a violência da polícia", "6" => "O racismo e outras formas de discriminação", "7" => "A lentidão e outros problemas da Justiça", "8" => "A destruição do meio ambiente", "9" => "A falta de perspectiva profissional para os jovens" }
                        },
               "p24a"=> { "Questão"   => "E na sua opinião, qual destas coisas (mostre CARTÃO 24) é o que existe de mais positivo hoje no Brasil?  ", 
                          "Respostas" => { "1" => "Estabilidade econômica", "2" => "Políticas sociais", "3" => "Possibilidade do consumo", "4" => "Liberdade de expressão", "5" => "Possibilidades de estudo", "6" => "Ter democracia", "7" => "outras", "8" => "nenhuma", "9" => "não sabe" }
                        },
               "p24b"=> { "Questão"   => "E em segundo lugar?", 
                          "Respostas" => { "1" => "Estabilidade econômica", "2" => "Políticas sociais", "3" => "Possibilidade do consumo", "4" => "Liberdade de expressão", "5" => "Possibilidades de estudo", "6" => "Ter democracia", "7" => "outras", "8" => "nenhuma", "9" => "não sabe" }
                        },
               "p24c"=> { "Questão"   => "E em terceiro lugar?", 
                          "Respostas" => { "1" => "Estabilidade econômica", "2" => "Políticas sociais", "3" => "Possibilidade do consumo", "4" => "Liberdade de expressão", "5" => "Possibilidades de estudo", "6" => "Ter democracia", "7" => "outras", "8" => "nenhuma", "9" => "não sabe" }
                        },
               "p25" => { "Questão"   => "Na sua opinião, a política é uma coisa:", 
                          "Respostas" => { "1" => "muito importante", "2" => "mais ou menos importante", "3" => "nada importante", "4" => "Não sabe" }
                        },
               "p26" => { "Questão"   => "De um modo geral, qual das seguintes frases se aproxima mais da relação que você tem com a política: (leia até alternativa 4, enumerando-as): ", 
                          "Respostas" => { "1" => "Um, considero-me politicamente participante", "2" => "ois, não costumo participar mas me interesso por política", "3" => "Três, acho que a política deve ficar para pessoas que tem mais competência ", "4" => "Quatro, não gosto de política, não me envolvo", "5" => "Outras respostas", "6" => "não sabe" }
                        # "Respostas" => { "1" => "", "2" => "", "3" => "", "4" => "", "5" => "", "6" => "" }
                        },
               "p27a"=> { "Questão"   => "Na sua opinião, qual destas formas de atuação (mostre CARTÃO 27) pode ajudar mais a mudar ou a melhorar as coisas no Brasil? ", 
                          "Respostas" => { "1" => "A atuação em associações ou coletivos que se organizam por alguma causa", "2" => "A atuação em partidos políticos", "3" => "A atuação pela internet, opinando sobre assuntos importantes ou cobrando dos políticos e governantes", "4" => "A atuação em conselhos, conferências, audiências públicas ou outros canais de participação desse tipo", "5" => "A participação em mobilizações de rua e outras ações diretas", "7" => "outras", "8" => "nenhuma", "9" => "não sabe" }
                        },
               "p27b"=> { "Questão"   => "E em segundo lugar?", 
                          "Respostas" => { "1" => "A atuação em associações ou coletivos que se organizam por alguma causa", "2" => "A atuação em partidos políticos", "3" => "A atuação pela internet, opinando sobre assuntos importantes ou cobrando dos políticos e governantes", "4" => "A atuação em conselhos, conferências, audiências públicas ou outros canais de participação desse tipo", "5" => "A participação em mobilizações de rua e outras ações diretas", "7" => "outras", "8" => "nenhuma", "9" => "não sabe" }
                        },
               "p33a"=> { "Questão"   => "Você é a favor ou contra que casais de gays e de lésbicas possam adotar crianças?", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33b"=> { "Questão"   => "A prisão das mulheres que fazem aborto", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33c"=> { "Questão"   => "A reserva de cotas para negros e indígenas nas universidades", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33d"=> { "Questão"   => "a prisão das pessoas que usam maconha", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33e"=> { "Questão"   => "O respeito aos direiito humanos dos presos e criminosos", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33f"=> { "Questão"   => "O uso de crucifixos e outros símbolos religiosos em paredes de órgãos públicos", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p33g"=> { "Questão"   => " a Comissão da Verdade, que investiga  as mortes e desaparecimentos do período da ditadura militar?", 
                          "Respostas" => { "1" => "A favor Totalmente", "2" => "A favor Em parte", "3" => "Nem a favor nem contra", "4" => "Contra Totalmente", "5" => "Contra Em parte", "6" => "não sabe" }
                        },
               "p34" => { "Questão"   => "Pelo que você sabe ou ouviu falar, os governos no Brasil: (mostre CARTÃO 34 e leia até a alternativa 4)", 
                          "Respostas" => { "1" => "não conhecem nem se preocupam com as necessidades dos jovens", "2" => "conhecem as necessidades dos jovens, mas não fazem nada a respeito", "3" => "apóiam e promovem programas e ações voltadas para a juventude", "4" => "você não sabe se os governos têm ou não ações para a juventude?", "5" => "Outras respostas"}
                        },
               "p37" => { "Questão"   => "Os últimos governos federais têm promovido conferências públicas para discutir políticas com a população, para tentar resolver diferentes problemas sociais. Essas conferências acontecem primeiro nos municípios, depois nos estados e por fim tem a etapa nacional. Você já ouviu falar dessas conferências? (se sim) Participou de alguma? De quantas?", 
                          "Respostas" => { "1" => "Participou de 1", "2" => "Participou de 2", "3" => "Participou de 3", "4" => "Participou de 4", "5" => "Participou de 5", "6" => "Participou de 6", "7" => "Participou de 7 ou mais", "8" => "Ouviu falar mas nunca Participou de qualquer conferência", "9" => "Nunca ouviu falar"  }
                        },
               "p39" => { "Questão"   => "Falando agora de educação, até que ano da escola sua mãe (ou responsável do sexo feminino) completou?", 
                          "Respostas" => { "1" => "Não estudou", "2" => "Ensino Fundamental 1ª a 4ª serie", "3" => "Ensino Fundamental 5ª a 8ª serie", "4" => "Ensino Médio 2º grau", "5" => "Superior ou pós-graduação", "6" => "Não sabe" }
                        },
               "p40" => { "Questão"   => "E seu pai (ou responsável do sexo masculino), até que ano de escola ele completou?", 
                          "Respostas" => { "1" => "Não estudou", "2" => "Ensino Fundamental 1ª a 4ª serie", "3" => "Ensino Fundamental 5ª a 8ª serie", "4" => "Ensino Médio 2º grau", "5" => "Superior ou pós-graduação", "6" => "Não sabe" }
                        },
               "p41" => { "Questão"   => "Atualmente você está estudando, parou de estudar ou terminou os estudos?", 
                          "Respostas" => { "1" => "Está estudando", "2" => "Parou de estudar", "3" => "Terminou os estudos", "4" => "Não frequentou escola (espontânea)" }
                        },







             }

end
