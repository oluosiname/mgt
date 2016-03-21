class TodoController < Mgt::BaseController
  def initialize(request)
    @request = request
  end

  def index
    @pending = Todo.where("status like ?", "%pending%")
    @done = Todo.where("status like ?", "%done%")
    @todos = Todo.all
  end

  def new
    @pending = Todo.where("status like ?", "%pending%")
    @done = Todo.where("status like ?", "%done%")
    @todos = Todo.all
  end

  def show
    @todo = Todo.find_by(id: params["id"])
  end

  def edit
    @todo = Todo.find_by(id: params["id"])
  end

  def create
    @todo = Todo.new
    @todo.title = params["title"]
    @todo.body = params["body"]
    @todo.status = "pending"
    @todo.created_at = Time.now.to_s
    @todo.save
  end

  def update
    @todo = Todo.find_by(id: params["id"])
    @todo.update(title: params["title"], body: params["body"], status: params["status"])
    # @todo.title = params["title"]
    # @todo.body = params["body"]
    # @todo.status = params["status"]
    # @todo.save
  end

  def destroy
    @todo = Todo.find_by(id: params["id"])
    @todo.destroy
  end
end