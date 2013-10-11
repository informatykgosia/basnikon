class AddNewColumnToStory < ActiveRecord::Migration
  def change
    add_column :stories, :author_ids, :string
  end
end
