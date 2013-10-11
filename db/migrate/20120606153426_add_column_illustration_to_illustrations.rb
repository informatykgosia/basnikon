class AddColumnIllustrationToIllustrations < ActiveRecord::Migration
  def change
	add_column :illustrations, :illustration, :string	
  end
end
