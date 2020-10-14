class CreateTableStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :table_students do |t|
      t.string :name
      t.string :string
      t.string :age
      t.string :integer
    end
  end
end
