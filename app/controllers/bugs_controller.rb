class BugsController < ApplicationController
  before_filter :check_user_logged_in!

  def index
    @bugs = Bug.all
    @project = Project.find(params[:project_id])
  end
end
