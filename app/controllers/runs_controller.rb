class RunsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @runs = Run.where(user_id: params[:user_id])
    @mile_count = @runs.sum(:distance)
    @mile_count_ind = @runs.where(outdoors: false).sum(:distance)
    @mile_count_out = @runs.where(outdoors: true).sum(:distance)
    @long_run = @runs.maximum(:distance)
    @ind_runs = @runs.where(outdoors: false).count
    @out_runs = @runs.where(outdoors: true).count
    @long_run_ind = @runs.where(outdoors: false).maximum(:distance)
    @long_run_out = @runs.where(outdoors: true).maximum(:distance)
    @fast_pace = @runs.minimum(:pace).to_s.gsub(".",":")
    @fast_pace_mil = @runs.order(:pace).first
    @fast_pace_ind = @runs.where(outdoors: false).minimum(:pace).to_s.gsub(".",":")
    @fast_pace_out = @runs.where(outdoors: true).minimum(:pace).to_s.gsub(".",":")
    @fast_pace_ind_mil = @runs.where(outdoors: false).order(:pace).first
    @fast_pace_out_mil = @runs.where(outdoors: true).order(:pace).first
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
