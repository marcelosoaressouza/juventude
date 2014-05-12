class DadosController < ApplicationController
  # GET /filtros
  # GET /filtros.json
  def index
    @filtros = Filtro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados }
    end
  end

  # GET /filtros/1
  # GET /filtros/1.json
  def show
    @dados = []

    if params[:filtro]
      @filtro = Filtro.find(params[:filtro])
      @dados = getDados(@filtro)
    end

    respond_to do |format|
      format.js
    end
  end

end
