class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to guests_path, notice: "The guest has been created!" and return
    end

    render 'new'
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])

    if @guest.update_attributes(guest_params)
      redirect_to guests_path, notice: "#{name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    redirect_to guests_path, notice: "#{name} has been deleted!" and return
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :food_option, :dietary_requirements)
  end
end
