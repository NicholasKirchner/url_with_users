class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
    
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.timestamps

    end

    change_table :urls do |t|
      t.references :user
    end
  end
end