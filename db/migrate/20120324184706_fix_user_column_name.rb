class FixUserColumnName < ActiveRecord::Migration
  def up
    rename_column :users, :persistance_token, :persistence_token
  end

  def down
  end
end
