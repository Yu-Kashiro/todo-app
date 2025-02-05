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
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_path(board), notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_path(board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments.all
    @user = User.find(@task.user_id)
    # binding.pry
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
      redirect_to board_path(@task.board_id), notice: '削除できました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :board_id, :eye_catch, :user_id)
  end

end