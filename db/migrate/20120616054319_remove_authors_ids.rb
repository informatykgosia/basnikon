class RemoveAuthorsIds < ActiveRecord::Migration
  def up
    remove_column :stories, :author_ids
  end

  def down
  end
end
