class CreateWorkTickets < ActiveRecord::Migration
  def change
    create_table :work_tickets do |t|
      t.integer :operation_id
      t.integer :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
