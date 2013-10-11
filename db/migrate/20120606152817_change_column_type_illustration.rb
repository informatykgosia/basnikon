class ChangeColumnTypeIllustration < ActiveRecord::Migration
  def up
	remove_column :illustrations, :illustration
  end

  def down
	add_column :illustrations, :illustration, :string 
 end
end
