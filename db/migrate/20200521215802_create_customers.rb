class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |c|
      c.string :name
      c.string :phone_number
      c.integer :user_id
    end
  end
end
