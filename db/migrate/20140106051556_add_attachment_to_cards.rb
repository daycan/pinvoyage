class AddAttachmentToCards < ActiveRecord::Migration
  def change
  	add_attachment :cards, :card_image
  end
end
