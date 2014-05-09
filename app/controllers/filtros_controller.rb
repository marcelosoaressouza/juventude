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
    @filtro = Filtro.find(params[:id])

      # logger.debug("Filtrando #{filtro.tipo}")

      @dados = []
      @config = {}

      consulta = "tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?"
      valores  = [ @filtro.tipo, @filtro.area, @filtro.fxid, @filtro.cor, @filtro.sexo ]

#      if @filtro.tipo_grafico == 'line'
#
#        @dado_bruto = Dado.where(consulta, *valores).group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")
#        @dado_trata = [ { name: 'Valor', data: @dado_bruto } ]
#        @config[:dado] = { library: { title: { text: "#{@filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .0f}</b>' } } }
#        @dados = [ { id: "#{@filtro.titulo}", type: "#{@filtro.tipo_grafico}", data: @dado_trata, config: @config[:dado] } ]
#
#      elsif @filtro.tipo_grafico == 'bar'

        if @filtro.sexo == 3
          valores  = [ @filtro.tipo, @filtro.area, @filtro.fxid, @filtro.cor, 1 ]
          @dado_homens = Dado.where(consulta, *valores).group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")

          valores  = [ @filtro.tipo, @filtro.area, @filtro.fxid, @filtro.cor, 2 ]
          @dado_mulheres = Dado.where(consulta, *valores).group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")

          @dado_trata = [ { name: 'Homens', data: @dado_homens }, { name: 'Mulheres', data: @dado_mulheres } ]
        else
          @dado_bruto = Dado.where(consulta, *valores).group("#{@filtro.grupo}").sum("#{@filtro.objetivo} / 1000")
          @dado_trata = [ { name: 'Valor', data: @dado_bruto } ]
        end

        @config[:dado] = { library: { title: { text: "#{@filtro.titulo}" }, tooltip: { pointFormat: '{series.name}: <b>{point.y: .0f}</b>' } } }
        @dados = [ { id: "#{@filtro.titulo}", type: "#{@filtro.tipo_grafico}", data: @dado_trata, config: @config[:dado] } ]
#
#      end

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
  end

  # POST /filtros
  # POST /filtros.json
  def create
    @filtro = Filtro.new(params[:filtro])

    respond_to do |format|
      if @filtro.save
        format.html { redirect_to @filtro, notice: 'Filtro was successfully created.' }
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

    respond_to do |format|
      if @filtro.update_attributes(params[:filtro])
        format.html { redirect_to @filtro, notice: 'Filtro was successfully updated.' }
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
