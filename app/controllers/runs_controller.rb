class RunsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @runs = Run.where(user_id: params[:user_id])
    @long_run = Run.maximum(:distance)
    @ind_runs = Run.where(outdoors: false).count
    @out_runs = Run.where(outdoors: true).count
    @long_run_ind = Run.where(outdoors: false).maximum(:distance)
    @long_run_out = Run.where(outdoors: true).maximum(:distance)
    @fast_pace = Run.minimum(:pace)
    @fast_pace_mil = Run.order(:pace).first
    @fast_pace_ind = Run.where(outdoors: false).minimum(:pace)
    @fast_pace_out = Run.where(outdoors: true).minimum(:pace)
    @fast_pace_out_mil = Run.where(outdoors: true).order(:pace).first
    @fast_pace_ind_mil = Run.where(outdoors: false).order(:pace).first
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
