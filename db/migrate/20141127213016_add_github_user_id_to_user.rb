class AddGithubUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :github_user_id, :string
  end
end
