class AddPictureDescriptionToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :image_description, :string

  end
end
