class DeleteGitgametokenFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :gitgame_token
  end

  def down
    add_column :users, :gitgame_token, :string
  end
end
