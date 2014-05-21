class AddSlugToFiltros < ActiveRecord::Migration
  def change
    add_column :filtros, :slug, :string
    add_index  :filtros, :slug, unique: true
  end
end
