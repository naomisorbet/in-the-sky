class AddSessionParametersToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_digest, :string
    add_column :users, :session_token, :string
    
    add_index :users, :session_token
  end
end
