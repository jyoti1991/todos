class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :Name
      t.text :Description
      t.float :Price

      t.timestamps
    end
  end
end
