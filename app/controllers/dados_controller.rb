class DadosController < ApplicationController
  # GET /dados
  # GET /dados.json
  def index
    @temas = Tema.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filtros }
    end
  end

  # GET /dados/1
  # GET /dados/1.json
  def show
    @dados = []

    if params[:filtro]
      @dados = getDadosByFiltro(Filtro.find(params[:filtro]))
    elsif params[:tema]
      @dados = getDadosByTema(Tema.find(params[:tema]))
    end

    respond_to do |format|
      format.js
    end
  end

end
