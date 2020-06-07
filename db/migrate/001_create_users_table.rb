class CreateUsersTable < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :username
      t.text :email
      t.string :password_digest
    end
  end
end