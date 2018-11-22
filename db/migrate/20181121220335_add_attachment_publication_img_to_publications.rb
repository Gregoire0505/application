class AddAttachmentPublicationImgToPublications < ActiveRecord::Migration[5.2]
  def self.up
    change_table :publications do |t|
      t.attachment :publication_img
    end
  end

  def self.down
    remove_attachment :publications, :publication_img
  end
end
