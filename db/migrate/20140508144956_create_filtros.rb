class CreateFiltros < ActiveRecord::Migration
  def change
    create_table :filtros do |t|
      t.string :titulo
      t.string :tipo_grafico
      t.integer :fxid
      t.integer :univ
      t.integer :tipo
      t.integer :area
      t.integer :sexo
      t.integer :cor
      t.string :grupo
      t.string :objetivo

      t.timestamps
    end
  end
end
