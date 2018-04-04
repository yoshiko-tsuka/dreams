class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :chapter_title
      t.text :content
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
