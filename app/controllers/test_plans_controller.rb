class TestPlansController < ApplicationController
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
    if @test_plan.save
      redirect_to [@project, @test_plan]
    else
      render "new"
    end
  end

  def show
    @test_plan = TestPlan.find(params[:id])
    @project = Project.find(params[:project_id])
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
      render "edit"
    end 
  end

  def destroy
    @test_plan = TestPlan.find(params[:id])
    @test_plan.destroy
    redirect_to @test_plan
  end
private
  def test_plan_params
    params.require(:test_plan).permit(:test_plan_name, :test_plan_description) 
  end
end