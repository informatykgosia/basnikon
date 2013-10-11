class RemoveImageAuthorFromAuthors < ActiveRecord::Migration
  def up
    remove_column :authors, :image_author
  end

  def down
  end
end
