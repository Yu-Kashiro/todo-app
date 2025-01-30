class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_task_path(board,@task), notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :board_id, :eye_catch)
  end

end