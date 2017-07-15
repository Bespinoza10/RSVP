class GuestsController < ApplicationController
  before_action :find_guest,  only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:new, :show, :edit]

  def index
    @guest = Guest.all
  end
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new guest_params

    if @guest.save
      redirect_to @guest, notice: "Your Guest has been created and saved!"
    else
      render 'new', notice: "Sorry, Your Guest wasn't succesfully saved."
    end
  end

  def show
    if (@guest.yes_no == true)
      @yesText = "Yes we are going! :)".html_safe
    end

    if (@guest.no_yes == true)
      @noText = "Sorry, we cant go :(".html_safe
    end
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
    params.require(:guest).permit(:guest_name, :email, :number_of_guest, :yes_no, :no_yes, :slug, :comments)
  end

  def find_guest
    @guest = Guest.find(params[:id])
  end


end
