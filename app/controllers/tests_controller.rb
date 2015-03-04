class TestsController < ApplicationController
  def index
    @test = Test.all
  end

  def new
        @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render "new"
    end
  end

  def show
    @test = Test.find_by_id(params[:id])
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to @test
  end

  def update
    @test = Test.find(params[:id])
  if @test.update(test_params)
  redirect_to @test
  else
    render "edit"
  end
end
  
  def edit
     @test = Test.find(params[:id])
  end
  
  private
  def test_params
    params.require(:test).permit(:title, :description, :criticality, :time)
  end
end
