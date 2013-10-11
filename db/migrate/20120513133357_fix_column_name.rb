class FixColumnName < ActiveRecord::Migration
  def change
  rename_column :heros, :descritpion, :description
  end
end
