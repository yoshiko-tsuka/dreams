class AddResumeToNovels < ActiveRecord::Migration[5.0]
  def change
    add_column :novels, :resume, :string, default: '設定されていません'
  end
end
