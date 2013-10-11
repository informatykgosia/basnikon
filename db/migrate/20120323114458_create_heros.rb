class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.text :descritpion
      t.references :story

      t.timestamps
    end
    add_index :heros, :story_id
  end
end
