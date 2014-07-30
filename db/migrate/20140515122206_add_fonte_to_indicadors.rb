class AddFonteToIndicadors < ActiveRecord::Migration
  def change
    add_column :indicadors, :fonte, :integer
  end
end
