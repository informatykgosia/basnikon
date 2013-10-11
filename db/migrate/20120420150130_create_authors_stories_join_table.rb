class CreateAuthorsStoriesJoinTable < ActiveRecord::Migration
  def change
      create_table :authors_stories, :id => false do |t|
        t.integer :author_id
        t.integer :story_id
      end
  end

end
