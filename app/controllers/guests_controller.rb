class GuestsController < ApplicationController
  def backoffice
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)

    first_name = @guest.name.split.first

    if @guest.save
      redirect_to new_guest_path, notice: "Thank you #{first_name}, your RSVP has been received!" and return
    end

    redirect_to new_guest_path, alert: 'The name field cannot be blank'
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])

    if @guest.update_attributes(guest_params)
      redirect_to guests_path, notice: "#{@guest.name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    redirect_to guests_backoffice_path, notice: "#{@guest.name} has been deleted!" and return
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :attendance, :food_option, :dietary_requirements)
  end
end
