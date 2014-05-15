class CreateTemasFiltros < ActiveRecord::Migration
  def change
    create_table :temas_filtros do |t|
      t.references :tema
      t.references :filtro

      t.timestamps
    end
    add_index :temas_filtros, :tema_id
    add_index :temas_filtros, :filtro_id
  end
end
