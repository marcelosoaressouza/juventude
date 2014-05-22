class AddAttachmentImagemToTemas < ActiveRecord::Migration
  def self.up
    change_table :temas do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :temas, :imagem
  end
end
