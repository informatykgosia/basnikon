class RemoveAuthorImageFromAuthors < ActiveRecord::Migration
  def up
    remove_column :authors, :author_image
      end

  def down
  end
end
