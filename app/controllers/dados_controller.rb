class DadosController < ApplicationController
  def show
    @config = {}

    if params[:filtro]
      @filtro = Filtro.find(params[:filtro])


      @dados = []

      if @filtro.tipo_grafico == 'line'
        logger.debug("Filtrando line: #{@filtro.tipo_grafico}")

        @dado_bruto = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                                 @filtro.tipo, @filtro.area, @filtro.fxid, @filtro.cor, @filtro.sexo)
                          .group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")

        @dado_trata = [ { name: 'Valor', data: @dado_bruto } ]

        @config[:dado] = { library: { title: { text: "#{@filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .0f}</b>' } } }

        @dados = [ { id: "#{@filtro.titulo}", type: "#{@filtro.tipo_grafico}", data: @dado_trata, config: @config[:dado] } ]

      elsif @filtro.tipo_grafico == 'bar'
        logger.debug("Filtrando bar: #{@filtro.tipo_grafico}")

        @dado_bruto = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?",
                                 @filtro.tipo, @filtro.area, @filtro.fxid, @filtro.cor, @filtro.sexo)
                          .group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")

        @dado_trata = [ { name: 'Valor', data: @dado_bruto } ]

        @config[:dado] = { library: { title: { text: "#{@filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .0f}</b>' } } }

        @dados = [ { id: "#{@filtro.titulo}", type: "#{@filtro.tipo_grafico}", data: @dado_trata, config: @config[:dado] } ]
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def index
    @filtros = Filtro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados }
    end
  end
end
