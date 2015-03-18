class TestCasesController < ApplicationController
  before_filter :check_user_logged_in!


  def index
    @test = TestCase.all
  end

  def new
    @test = TestCase.new
  end

  def create
    @test = TestCase.new(test_params)
    if @test.save
      redirect_to test_cases_path
    else
      render "new"
    end
  end

  def show
    @test = TestCase.find_by_id(params[:id])
  end

  def destroy
    @test = TestCase.find(params[:id])
    @test.destroy
    redirect_to @test
  end

  def update
    @test = TestCase.find(params[:id])
    if @test.update(test_params)
      redirect_to @test
    else
      render "edit"
    end
  end
  
  def edit
    @test = TestCase.find(params[:id])
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
