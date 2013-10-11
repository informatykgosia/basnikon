class AddColumnToAuthors < ActiveRecord::Migration
  def change
	add_column :authors, :image, :string

  end
end
