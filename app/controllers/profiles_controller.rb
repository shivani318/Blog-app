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
      respond_to do |format|
        format.html { redirect_to @profile, notice: 'Profile was successfully created' }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      respond_to do |format|
        format.html { redirect_to @profile, notice: 'Profile was successfully updated' }
        # format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      # format.html { redirect_to root_path, notice: 'Profile was successfully destroyed'}
      format.js
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :image, :country, :state, :city)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
