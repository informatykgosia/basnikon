class AddImageColumnToAuthor < ActiveRecord::Migration
	add_column :authors, :image, :string

end
