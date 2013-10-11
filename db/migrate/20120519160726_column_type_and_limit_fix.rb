class ColumnTypeAndLimitFix < ActiveRecord::Migration
  def up
    change_column :stories, :description, :text, :limit=>nil
    change_column :authors, :description, :text, :limit=>nil
  end

  
end
