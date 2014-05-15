class FiltrosController < ApplicationController
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
    @dados = []

    if params[:id]
      @filtro = Filtro.find(params[:id])
      @dados = getDados(@filtro)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filtro }
    end
  end

  # GET /filtros/new
  # GET /filtros/new.json
  def new
    @filtro = Filtro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filtro }
    end
  end

  # GET /filtros/1/edit
  def edit
    @filtro = Filtro.find(params[:id])
    @tema = Tema.all
  end

  # POST /filtros
  # POST /filtros.json
  def create
    @filtro = Filtro.new(params[:filtro])

    respond_to do |format|
      if @filtro.save
        format.html { redirect_to @filtro, notice: 'Filtro foi Criado com sucesso.' }
        format.json { render json: @filtro, status: :created, location: @filtro }
      else
        format.html { render action: "new" }
        format.json { render json: @filtro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /filtros/1
  # PUT /filtros/1.json
  def update
    @filtro = Filtro.find(params[:id])
    @filtro.attributes = {'tema_ids' => []}.merge(params[:filtro] || {})

    respond_to do |format|
      if @filtro.update_attributes(params[:filtro])
        format.html { redirect_to @filtro, notice: 'Filtro foi Atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @filtro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filtros/1
  # DELETE /filtros/1.json
  def destroy
    @filtro = Filtro.find(params[:id])
    @filtro.destroy

    respond_to do |format|
      format.html { redirect_to filtros_url }
      format.json { head :no_content }
    end
  end
end
