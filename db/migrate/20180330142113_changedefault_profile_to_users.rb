class ChangedefaultProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :profile, 'プロフィールは設定されていません'
  end
end
