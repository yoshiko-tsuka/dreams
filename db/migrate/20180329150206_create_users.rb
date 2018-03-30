class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_code
      t.string :password_digest
      t.string :profile

      t.timestamps
    end
  end
end
