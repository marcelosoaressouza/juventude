class PnadsController < ApplicationController
  # GET /pnads/temas
  # GET /pnads/temas.json
  def temas
    @temas = Tema.all

    respond_to do |format|
      format.html # temas.html.erb
      format.json { render json: @temas }
    end
  end

  # GET /filtros
  # GET /filtros.json
  def index
    @filtros = Filtro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filtros }
    end
  end

  # GET /filtros/1
  # GET /filtros/1.json
  def show
    @pnads = []

    if params[:filtro]
      @pnads = getPnadsByFiltro(Filtro.find(params[:filtro]))
    elsif params[:tema]
      @pnads = getPnadsByTema(Tema.find(params[:tema]))
    end

    respond_to do |format|
      format.js
    end
  end

end
