class Filtro < ActiveRecord::Base
  has_many :temas_filtros, :dependent => :destroy
  has_many :temas, :through => :temas_filtros

  attr_accessible :objetivo, :fonte, :tema_ids
end
