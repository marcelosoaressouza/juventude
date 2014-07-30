class CreateIndicadors < ActiveRecord::Migration
  def change
    create_table :indicadors do |t|
      t.string :objetivo

      t.timestamps
    end
  end
end
