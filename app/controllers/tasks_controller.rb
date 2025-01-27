class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(id: @task), notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

end



private
def task_params
  params.require(:task).permit(:title, :content, :deadline )
end