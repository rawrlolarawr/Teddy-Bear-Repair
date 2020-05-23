class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |d|
      d.string :make
      d.string :model
      d.string :issue
      d.integer :hours_of_labor
      d.datetime :completed
      d.datetime :received
      d.decimal :total_price
      d.integer :customer_id
    end
  end
end
