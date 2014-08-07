class AgendasController < ApplicationController
  def index
    @temas = Tema.all

    if (params[:tema])
      @indicador = Tema.find(params[:tema])
    end
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
    @dados = []

    if params
      @dados = getAgendas(params)
    end

    respond_to do |format|
      format.js
    end
  end
end
