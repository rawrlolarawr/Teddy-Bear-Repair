class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |p|
      p.string :name
      p.decimal :price
      p.string :ordered
      p.integer :device_id
    end
  end
end
