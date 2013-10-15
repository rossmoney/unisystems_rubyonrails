class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :hashed_password
      t.string :username
      t.string :user_type

      t.timestamps
    end
  end
end
