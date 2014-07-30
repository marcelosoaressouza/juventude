class Indicador < ActiveRecord::Base
  has_many :temas_indicadors, :dependent => :destroy
  has_many :temas, :through => :temas_indicadors

  attr_accessible :objetivo, :fonte, :tema_ids
end
