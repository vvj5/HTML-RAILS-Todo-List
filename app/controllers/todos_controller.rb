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
      render 'show.html.erb', locals: { todos: Todo.find(params[:id]) }
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

