class RenameTokenColumnToGitgameToken < ActiveRecord::Migration
  def change
    rename_column :users, :token, :gitgame_token
  end
end
