class ApplicationController < ActionController::Base
  protect_from_forgery

  def getDadosByTema (tema)
    @dados = []

    temas_filtros = TemasFiltro.where("tema_id = ?", tema.id)

    temas_filtros.each do |temas_filtro|
      # logger.debug("Filtro ID #{filtro_id.filtro_id}")
      filtro = Filtro.find(temas_filtro.filtro_id)
      @dados += getDadosByFiltro(filtro)
    end

    return @dados
  end

  def getDadosByFiltro (filtro)
    # logger.debug("Filtrando #{filtro.tipo}")
    @dados = []
    config = {}

    consulta =  "tipo = ?  AND area = ?  AND fxid = ?  AND univ = ?  AND cor = ?  AND sexo = ?"
    valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, filtro.sexo ]

    dado_bruto = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")
    config[:dado] = { library: { title: { text: "#{filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .3f}</b>' } } }
    dado_trata = [ { name: 'Valor', data: dado_bruto } ]

    if filtro.sexo == 3

      # Absoluto? ("#{filtro.objetivo} / 1000")
      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 1 ]
      dado_homens = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 2 ]
      dado_mulheres = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      dado_trata = [ { name: "#{Filtro::SEXO.index(1)}", data: dado_homens },
                     { name: "#{Filtro::SEXO.index(2)}", data: dado_mulheres } ]

    elsif filtro.cor == 3

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, filtro.sexo ]
      dado_brancos = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, filtro.sexo ]
      dado_negros = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo}")

      dado_trata = [ { name: "#{Filtro::COR.index(1)}", data: dado_brancos },
                     { name: "#{Filtro::COR.index(2)}", data: dado_negros  } ]

    end

    @dados = [ { id: "#{filtro.titulo}", type: "#{filtro.tipo_grafico}", data: dado_trata, config: config[:dado] } ]

    return @dados
  end

end
