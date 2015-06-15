class AddAttachmentPhotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :photo
    end
    remove_attachment :festivals, :photo
    remove_attachment :venues, :photo
  end

  def self.down
    remove_attachment :events, :photo
  end
end
