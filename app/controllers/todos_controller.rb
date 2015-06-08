class TodosController < ApplicationController

  def index
    render "index.html.erb", locals: { todos: Todo.all }
  end

  def new
    render html: Todo.new
  end

  def create
    render html: Todo.create(entry: params[:entry])
  end

  def show
    begin
      render html: Todo.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      render html: { error: error.message }, status: 422
    end
  end

  def delete
    todo = Todo.find(params[:id])
    todo.destroy
    render html: { message: "Todo Detroyed" }
  end

end



# Sending a DELETE request to http://localhost:3000/todos/1
# should delete that todo from the database and return
# the message “deleted” as json (Using Postman)



# Sending a POST request to http://localhost:3000/todos with the params of { "body": "Finish Homework" }
# I should see my todo returned to me as json (Using Postman)

