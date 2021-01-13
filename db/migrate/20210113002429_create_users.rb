class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :username
      t.string :password
      t.string :email
      t.date :birthday
      t.timestamps
    end
  end
end
