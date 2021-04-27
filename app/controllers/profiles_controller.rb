class ProfilesController < ApplicationController
  before_action :set_profile, except: [:new, :create]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :image, :country, :state)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
