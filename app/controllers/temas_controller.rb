class TemasController < ApplicationController
  # GET /temas/dados/1
  # GET /temas/dados/1.json
  def dados
    @dados = []

    tema = Tema.find(params[:id])

    @pnads = getPnadsByTema(Tema.find(params[:tema]))

    respond_to do |format|
      format.js
    end
  end



  # GET /temas
  # GET /temas.json
  def index
    @temas = Tema.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @temas }
    end
  end

  # GET /temas/admin
  # GET /admin/temas.json
  def admin
    @temas = Tema.all

    respond_to do |format|
      format.html # admin.html.erb
      format.json { render json: @temas }
    end
  end

  # GET /temas/1
  # GET /temas/1.json
  def show
    @tema = Tema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tema }
    end
  end
	
  # GET /temas/new
  # GET /temas/new.json
  def new
    @tema = Tema.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tema }
    end
  end

  # GET /temas/1/edit
  def edit
    @tema = Tema.find(params[:id])
  end

  # POST /temas
  # POST /temas.json
  def create
    @tema = Tema.new(params[:tema])

    respond_to do |format|
      if @tema.save
        format.html { redirect_to @tema, notice: 'Tema foi Criado com sucesso.' }
        format.json { render json: @tema, status: :created, location: @tema }
      else
        format.html { render action: "new" }
        format.json { render json: @tema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /temas/1
  # PUT /temas/1.json
  def update
    @tema = Tema.find(params[:id])

    respond_to do |format|
      if @tema.update_attributes(params[:tema])
        format.html { redirect_to @tema, notice: 'Tema foi Atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temas/1
  # DELETE /temas/1.json
  def destroy
    @tema = Tema.find(params[:id])
    @tema.destroy

    respond_to do |format|
      format.html { redirect_to temas_url }
      format.json { head :no_content }
    end
  end
end
