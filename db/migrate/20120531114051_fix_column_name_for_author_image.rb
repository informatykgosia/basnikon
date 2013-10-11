class FixColumnNameForAuthorImage < ActiveRecord::Migration
  def up
	rename_column :authors, :image, :author_image
  end

  def down
  end
end
