class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |p|
      p.string :name
      p.decimal :price
      p.datetime :ordered
      p.integer :device_id
    end
  end
end
