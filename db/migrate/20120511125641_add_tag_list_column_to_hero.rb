class AddTagListColumnToHero < ActiveRecord::Migration
  def change
    add_column :heros, :tag_list, :string

  end
end
