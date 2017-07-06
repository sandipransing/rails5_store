class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.decimal :price
      t.string :color
      t.date :inward_date
      t.boolean :status
      t.text :description

      t.timestamps
    end
  end
end
