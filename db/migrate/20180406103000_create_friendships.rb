class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :novel, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :novel_id , :type], unique: true
    end
  end
end
