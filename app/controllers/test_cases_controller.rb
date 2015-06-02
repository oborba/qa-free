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
      if params[:test_plan]
        redirect_to [@project, @test_plan]
      else
        redirect_to [@project, @test]
      end
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
    if params[:test_plan_id]
      @test.destroy
      redirect_to [@project, test_plan]
    else
      @test.destroy
      redirect_to [@project, @test]
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @test = TestCase.find(params[:id])
    if @test.update(test_params)
      if params[:test_plan_id]
        redirect_to [@project, test_plan]
      else
        redirect_to [@project, @test]
      end
    else
      render "edit"
    end
  end

  def edit
    @test = TestCase.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def test_plan
    @test_plan ||= TestPlan.find(params[:test_plan_id]) if params[:test_plan_id].present?
  end
  helper_method :test_plan

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
