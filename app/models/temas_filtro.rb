class TemasFiltro < ActiveRecord::Base
  belongs_to :tema
  belongs_to :filtro
end
