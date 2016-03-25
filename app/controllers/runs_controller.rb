class RunsController < ApplicationController

  def index
    @runs = Run.where(user_id: params[:user_id])
  end
end
