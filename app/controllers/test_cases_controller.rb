class TestCasesController < ApplicationController
  before_filter :check_user_logged_in!

  def index
    @test = TestCase.all
    @project = Project.find(params[:project_id])
  end

  def new
    @test = TestCase.new
    @project = Project.find(params[:project_id])
    @test_plan = TestPlan.find(params[:test_plan]) if params[:test_plan]
  end

  def create
    @project = Project.find(params[:project_id])
    @test = TestCase.new(test_params)
    if params[:test_plan]
      @test_plan = TestPlan.find(params[:test_plan][:id])
      @test.test_plans << @test_plan
    end
    @test.project = @project
    if @test.save
      redirect_to [@project, @test]
    else
      render "new"
    end
  end

  def show
    @test = TestCase.find_by_id(params[:id])
    @project = Project.find(params[:project_id])
  end

  def destroy
    @project = Project.find(params[:project_id])
    @test = TestCase.find(params[:id])
    @test.destroy
    redirect_to [@project, @test]
  end

  def update
    @project = Project.find(params[:project_id])
    @test = TestCase.find(params[:id])
    if @test.update(test_params)
      redirect_to [@project, @test]
    else
      render "edit"
    end
  end

  def edit
    @test = TestCase.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  private
  def test_params
    params.require(:test_case).permit(:status, :title, :description, :criticality, :time)
  end

  def check_admin_logged_in!
    authenticate_admin!
  end

  def check_user_logged_in!
    if !admin_signed_in?
      authenticate_user!
    end
  end
end
