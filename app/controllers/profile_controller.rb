class ProfileController < ApplicationController
  def edit_profile
    @user= User.find(session[:user])
    if request.post?
      if @user.update(user_params)
        flash[:notice]= "Changes Updated."
        redirect_to account_dashboard_url
      else
        flash[:notice]= "Changes couldn't be updated."
        render profile_edit_path
      end
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :mobile, :dob, :image)
  end
end
