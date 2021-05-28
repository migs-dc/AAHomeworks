class Fix < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password_digest, :string, null: false
    change_column :users, :session_token, :string, null: false
  end
end
