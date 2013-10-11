class AddUserIdColumnToHero < ActiveRecord::Migration
  def change
    add_column :heros, :user_id, :integer

  end
end
