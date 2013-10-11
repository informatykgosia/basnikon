class RemoveColumnAuthorImage < ActiveRecord::Migration
  def up
  end

  def down
	remove_column :authors, :image_author
  end
end
