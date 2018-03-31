class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :atmosphere, default: '色々'
      t.boolean :active, default: false
      t.boolean :dream, default: false

      t.timestamps
    end
  end
end
