class AddUseridToTodos < ActiveRecord::Migration
  def change
		add_column :todos, :user_id , :string  	
  end
end
