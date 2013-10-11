class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.integer :author_id
      t.integer :story_id

      t.timestamps
    end
  end
end
