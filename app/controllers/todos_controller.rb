class TodosController < ApplicationController
 before_action :authenticate_user!, :except => [:index,:show]
 before_action :authenticate_user!, :only => [:edit,:update,:destroy]
  # http_basic_authenticate_with name: "root", password: "dine", except: [:index, :show]
def new
	@todo = Todo.new
end

def create
  @todo = Todo.new(todo_params)
  @todo.user_id = current_user.id
 if @todo.save
  redirect_to todos_path
else
  render 'new'
end
end

def index
    @todos = Todo.order("id DESC").all
    
end
  def show
    @todo = Todo.find(params[:id])
  end

  def edit
  @todo = Todo.find(params[:id])
end

  def update
  @todo = Todo.find(params[:id])
 
  if @todo.update(todo_params)
    redirect_to @todo
  else
    render 'edit'
  end
end

def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
 
    redirect_to todos_path
  end
private

  def todo_params
    params.require(:todo).permit(:Name, :Description,:Price,:image,:user_id)
  end
end