class AddPictureColumnToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :picture, :string

  end
end
