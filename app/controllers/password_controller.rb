class PasswordController < ApplicationController
  def forget_password
    if request.post?
      @user= User.find_by_email_id(params[:email_id])
      if @user
        new_password= create_random_password
        @user.update(:password=>new_password)
        #PostmanMailer.forget_password.deliver
        flash[:notice]= "Password sent to your registered email"
        puts "==============="
        puts new_password
        puts "==============="
        redirect_to account_login_url
      else
        flash[:notice]= "Email not registered!"
        render :action=> :forget_password
      end
    end
  end

  def reset_password
    if(!session[:user])
      redirect_to account_login_url
    end
    @user= User.find(session[:user])
    if request.post?
      if @user
        if @user.update(user_params)
          #PostmanMailer.reset_password.deliver
          flash[:notice]= "Your password has been reset."
          redirect_to account_dashboard_url
        else
          flash[:notice]= "Enter valid password."
          render password_reset_password_path
        end
      end
    end
  end
  
  def create_random_password
    return (0...6).map { (65+rand(26)).chr }.join
  end

  def user_params
    params.permit(:password, :password_confirmation)
  end
end
