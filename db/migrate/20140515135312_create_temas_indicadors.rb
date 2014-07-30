class CreateTemasIndicadors < ActiveRecord::Migration
  def change
    create_table :temas_indicadors do |t|
      t.references :tema
      t.references :indicador

      t.timestamps
    end
    add_index :temas_indicadors, :tema_id
    add_index :temas_indicadors, :indicador_id
  end
end
