class CreateFiltros < ActiveRecord::Migration
  def change
    create_table :filtros do |t|
      t.string :objetivo

      t.timestamps
    end
  end
end
