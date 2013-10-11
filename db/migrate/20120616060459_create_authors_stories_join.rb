class CreateAuthorsStoriesJoin < ActiveRecord::Migration
  def up
    create_table 'authors_stories', :id => false do |t|
      t.column 'author_id', :integer
      t.column 'story_id', :integer
    end
  end

  def down
    drop_table 'authors_stories'
  end
end
