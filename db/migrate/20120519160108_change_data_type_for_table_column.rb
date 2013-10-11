class ChangeDataTypeForTableColumn < ActiveRecord::Migration
  def up
    change_column :authors, :description, :text
  end

end
