class AddNovelToChapters < ActiveRecord::Migration[5.0]
  def change
    add_reference :chapters, :novel, foreign_key: true
  end
end
