class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.integer :hero_id
      t.integer :illustration
      t.string :description
      t.string :user_name

      t.timestamps
    end
add_foreign_key :illustrations, :heros

  end
end
