class AddSlugToTemas < ActiveRecord::Migration
  def change
    add_column :temas, :slug, :string
    add_index  :temas, :slug, unique: true
  end
end
