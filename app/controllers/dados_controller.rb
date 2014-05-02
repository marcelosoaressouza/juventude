class DadosController < ApplicationController
  def index
    @sexo  = Dado.where("tipo = ? AND area = ? AND (sexo = ? OR sexo = ?)", 2, 1, 'Homem', 'Mulher').group(:sexo).count
    @educa_homem = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?", 1, 1, 1517, 'Negros', 'Homem').group(:ano).sum(:educa)
    @educa_mulher = Dado.where("tipo = ? AND area = ? AND fxid = ? AND cor = ? AND sexo = ?", 1, 1, 1517, 'Negros', 'Mulher').group(:ano).sum(:educa)
    @educa = [ { name: 'Homem', data: @educa_homem }, { name: 'Mulher', data: @educa_mulher } ]

    @dados = [ { pie: @sexo }, { line: @educa} ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados }
    end
  end
end
