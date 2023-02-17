class AccountController < ApplicationController
    def signup
        @user=User.new
        if request.post?
            @user= User.new(user_params)
            PostmanMailer.signup_alert(@user).deliver
            if @user.save
                redirect_to :action=> :login
            else
                render :action=> "signup"
            end
        end
    end

    def login
        if request.post?
            @user= User.authenticate_user(params[:email_id], params[:password])
            if @user
                flash[:notice]= "You are Logged In"
                session[:user]= @user.id
                redirect_to :action=> :dashboard
            else
                flash[:notice]= "Invalid email/password"
                render :action=> :login
            end
        end
    end

    def dashboard
        if (!session[:user])
            redirect_to account_login_url
        end
        @user= User.find(session[:user])
        @fname= @user.first_name
        @lname= @user.last_name
        @mobile= @user.mobile
        
    end

    def logout
        session.delete(:user)
        flash[:notice]= "Successfully Logged Out"
        redirect_to account_login_path
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :email_id, :password, :password_confirmation, :mobile, :dob, :image)
    end
end
