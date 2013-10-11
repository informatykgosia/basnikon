class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :kind
      t.string :crypted_password
      t.boolean :admin
      t.string :persistance_token

      t.timestamps
    end
  end
end
