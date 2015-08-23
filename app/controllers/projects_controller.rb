class ProjectsController < ApplicationController
  before_filter :check_admin_logged_in!, except: [:show, :index]
  before_filter :check_user_logged_in!, only: [:show, :index]

  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find_by_id(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def check_admin_logged_in!
    authenticate_admin!
  end

  def check_user_logged_in!
    authenticate_user! unless admin_signed_in?
  end
end
