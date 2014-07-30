class IndicadorsController < ApplicationController
  # GET /indicadors
  # GET /indicadors.json
  def index
    @indicadors = Indicador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicadors }
    end
  end

  # GET /indicadors/1
  # GET /indicadors/1.json
  def show
    @dados = []

    @indicador = Indicador.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicador }
    end
  end

  # GET /indicadors/new
  # GET /indicadors/new.json
  def new
    @indicador = Indicador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicador }
    end
  end

  # GET /indicadors/1/edit
  def edit
    @indicador = Indicador.find(params[:id])
  end

  # POST /indicadors
  # POST /indicadors.json
  def create
    @indicador = Indicador.new(params[:indicador])
    @indicador.attributes = {'tema_ids' => []}.merge(params[:indicador] || {})

    respond_to do |format|
      if @indicador.save
        format.html { redirect_to @indicador, notice: 'Indicador foi Criado com sucesso.' }
        format.json { render json: @indicador, status: :created, location: @indicador }
      else
        format.html { render action: "new" }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicadors/1
  # PUT /indicadors/1.json
  def update
    @indicador = Indicador.find(params[:id])
    @indicador.attributes = {'tema_ids' => []}.merge(params[:indicador] || {})

    respond_to do |format|
      if @indicador.update_attributes(params[:indicador])
        format.html { redirect_to @indicador, notice: 'Indicador foi Atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadors/1
  # DELETE /indicadors/1.json
  def destroy
    @indicador = Indicador.find(params[:id])
    @indicador.destroy

    respond_to do |format|
      format.html { redirect_to indicadors_url }
      format.json { head :no_content }
    end
  end
end
