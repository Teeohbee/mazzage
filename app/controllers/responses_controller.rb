class ResponsesController < ApplicationController
  def index
    @responses = Response.all
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)

    if @response.save
      redirect_to root_path, notice: "The person has been created!" and return
    end
    render 'new'
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])

    if @response.update_attributes(response_params)
      redirect to responses_path, notice: "#{@response.full_name} has been updated!" and return
    end
    render 'edit'
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    redirect_to responses_path, notice: "#{@response.full_name} has been deleted!" and return
  end

  private

  def response_params
    params.require(:response).permit(:full_name, :food_option, :notes)
  end
end
