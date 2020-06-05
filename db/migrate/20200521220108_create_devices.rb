class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |d|
      d.string :make
      d.string :model
      d.string :issue
      d.integer :hours_of_labor
      d.string :completed
      d.string :received
      d.decimal :total_price
      d.integer :customer_id
    end
  end
end
