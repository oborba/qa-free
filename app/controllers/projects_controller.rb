class ProjectsController < ApplicationController
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
      render "new"
    end
  end
  
  def show
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def project_params
    params.require(:project).permit(:name, :descripition)
  end
end
