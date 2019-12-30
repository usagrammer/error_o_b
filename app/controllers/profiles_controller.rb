class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user)
    else
      @error = "登録に失敗しました。"
      render action: :new
    end
  end

  def edit
    @profile = Profile.find(current_user.profile.id)
  end

  def update
    @profile = Profile.find(params[:id])
    if Profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      @error = "登録に失敗しました。"
      render action: :edit
    end
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy
    redirect_to user_path(current_user)
  end


  private

  def profile_params
    params.require(:profile).permit(:age, :gender, :last_name, :first_name, :height, :weight, :foot_size, :address, :skill, :favorite_food, :introduction).merge(user_id: current_user.id)
  end
end
