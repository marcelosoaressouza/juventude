class TemasIndicador < ActiveRecord::Base
  belongs_to :tema
  belongs_to :indicador
end
