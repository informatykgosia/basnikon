class AddColumnImageAuthorToAuthors < ActiveRecord::Migration
  def change
	add_column :authors, :image_author, :string

  end
end
