class TestPlansController < ApplicationController
  before_filter :check_user_logged_in!

  def index
    @test_plans = TestPlan.all
    @project = Project.find(params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
    @test_plan = @project.test_plans.build
  end

  def create
    @project = Project.find(params[:project_id])
    @test_plan = TestPlan.new(test_plan_params)
    @test_plan.project = @project
    if @test_plan.save
      redirect_to [@project, @test_plan]
    else
      render 'new'
    end
  end

  def show
    @test_plan          = TestPlan.find(params[:id])
    @project            = Project.find(params[:project_id])
    @passed_tests       = TestPlan.find(params[:id]).number_of_tests('Passed')
    @blocked_tests      = TestPlan.find(params[:id]).number_of_tests('Blocked')
    @failured_tests     = TestPlan.find(params[:id]).number_of_tests('Failure')
    @not_executed_tests = TestPlan.find(params[:id]).number_of_tests('Not_Executed')
  end

  def edit
    @test_plan = TestPlan.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:project_id])
    @test_plan = TestPlan.find(params[:id])
    if @test_plan.update(test_plan_params)
      redirect_to [@project, @test_plan]
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @test_plan = TestPlan.find(params[:id])
    @test_plan.destroy
    redirect_to [@project, @test_plan]
  end

  private

  def test_plan_params
    params.require(:test_plan).permit(:test_plan_name, :test_plan_description)
  end
end
