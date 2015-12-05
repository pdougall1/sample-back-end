class AddHashedAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :hashed_auth_token, :string, unique: true
  end
end
