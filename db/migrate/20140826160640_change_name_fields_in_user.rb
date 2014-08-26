class ChangeNameFieldsInUser < ActiveRecord::Migration
  def change
    rename_column :users, :name, :username
    add_column :users, :screen_name, :string
  end
end
