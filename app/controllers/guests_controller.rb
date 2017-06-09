class GuestsController < ApplicationController

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new guest_params

    if @guest.save
      redirect_to @post, notice: "Your Guest has been created and saved!"
    else
      render 'new', notice: "Sorry, Your Guest wasn't succesfully saved."
    end
  end

  def show
  end
  def edit
  end

  def update
    if @guest.update guest_params
      redirect_to @guest, notice: "Thank you for confirming! See you guys soon!"
    else
      render 'new', notice: "Oh no! Your Confirmation wasn't succesfully saved!"
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_path, notice: "You Deleted Your Guest Succesfully"
  end

  private

  def guest_params
    params.require(:guest).permit(:guest_name, :number_of_guest, :yes_no, :slug, :comments)
  end

  def find_post
    @guest = Guest.friendly.find(params[:id])
  end


end
