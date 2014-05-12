class ApplicationController < ActionController::Base
  protect_from_forgery

  def getDados (filtro)
    # logger.debug("Filtrando #{filtro.tipo}")
    @dados = []
    @config = {}

    consulta =  "tipo = ?  AND area = ?  AND fxid = ?  AND univ = ?  AND cor = ?  AND sexo = ?"
    valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, filtro.sexo ]

    @dado_bruto = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo} / 1000")
    @dado_trata = [ { name: 'Valor', data: @dado_bruto } ]

    if filtro.sexo == 3

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 1 ]
      @dado_homens = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo} / 1000")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, filtro.cor, 2 ]
      @dado_mulheres = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo} / 1000")

      @dado_trata = [ { name: "#{Filtro::SEXO.index(1)}", data: @dado_homens }, { name: "#{Filtro::SEXO.index(2)}", data: @dado_mulheres } ]

    elsif filtro.cor == 3

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 1, filtro.sexo ]
      @dado_brancos = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo} / 1000")

      valores  = [ filtro.tipo, filtro.area, filtro.fxid, filtro.univ, 2, filtro.sexo ]
      @dado_negros = Dado.where(consulta, *valores).group("#{filtro.grupo}").order("#{filtro.grupo}").sum("#{filtro.objetivo} / 1000")

      @dado_trata = [ { name: "#{Filtro::COR.index(1)}", data: @dado_brancos }, { name: "#{Filtro::COR.index(2)}", data: @dado_negros } ]

    end

    @config[:dado] = { library: { height: 800, title: { text: "#{filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .0f}</b>' } } }
    @dados = [ { id: "#{filtro.titulo}", type: "#{filtro.tipo_grafico}", data: @dado_trata, config: @config[:dado] } ]

    return @dados
  end

end
