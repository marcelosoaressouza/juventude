class Tema < ActiveRecord::Base
  has_many :temas_filtros, :dependent => :destroy
  has_many :filtros, :through => :temas_filtros

  # accepts_nested_attributes_for :filtros

  attr_accessible :titulo
end
