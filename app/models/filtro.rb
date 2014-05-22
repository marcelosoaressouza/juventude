class Filtro < ActiveRecord::Base
  extend FriendlyId
  friendly_id :titulo, use: :slugged

  has_many :temas_filtros, :dependent => :destroy
  has_many :temas, :through => :temas_filtros

  attr_accessible :area, :cor, :fxid, :grupo, :objetivo, :sexo, :tipo, :tipo_grafico, :titulo, :univ, :fonte, :tema_ids
end
