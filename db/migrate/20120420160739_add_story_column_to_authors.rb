class AddStoryColumnToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :story_id, :integer

  end
end
