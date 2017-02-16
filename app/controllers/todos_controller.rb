class TodosController < ApplicationController
	
  def index
    @todos = Todo.where(user_id: current_user.id) 
  end
  
  

  def create
    @user = User.find(current_user.id)
    @todo = @user.todos.create(todo_params)
    todos = Todo.all
    respond_to do |format|
      format.json { 
      render json: {:results => todos}
      puts json: {:results => todos}
      }
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    respond_to do |format|
      if todo.destroy
        format.html { redirect_to root_path }
      end
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:description, :priority)
    end

end
