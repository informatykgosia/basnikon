class AddDescriptionColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :description, :string

  end
end
