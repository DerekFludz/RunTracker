class RunsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @runs = Run.where(user_id: params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @run = Run.new
  end

  def create
    @user = User.find(params[:user_id])
    @run = Run.new(run_params)

    if @run.save
      redirect_to user_runs_path(current_user.id)
    else
      render :new
    end
  end

  private

  def run_params
    params.require(:run).permit(:run_date, :distance, :pace, :outdoors, :user_id)
  end

end
