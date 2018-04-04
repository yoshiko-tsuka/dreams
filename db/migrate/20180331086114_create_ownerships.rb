class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.references :novel, foreign_key: true
      t.references :chapter, foreign_key: true
      t.integer :chapter_num, default: 1
      t.integer :page_num, default: 1

      t.timestamps
    end
  end
end
