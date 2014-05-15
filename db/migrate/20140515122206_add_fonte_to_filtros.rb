class AddFonteToFiltros < ActiveRecord::Migration
  def change
    add_column :filtros, :fonte, :integer
  end
end
