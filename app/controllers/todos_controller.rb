class TodosController < ApplicationController
	
  def index
    @todos = Todo.all  
  end
  
  

  def create
    @todo = Todo.create(todo_params)
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
    #todo.destroy
    respond_to do |format|
      if todo.destroy
        format.html { redirect_to root_path }
        #format.json { render action: 'index', status: :created, location: todo }
      end
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:description, :priority)
    end

end
