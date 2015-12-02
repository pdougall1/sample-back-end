class MakeRoleNameCorrect < ActiveRecord::Migration
  def change
    remove_column :roles, :status
    change_column :roles, :name, :integer
  end
end
