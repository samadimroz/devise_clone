class PostmanMailer < ApplicationMailer
    
    def signup_alert(data)
        @fname= data.first_name
        @lname= data.last_name
        @email= data.email_id
        @mobile= data.mobile
        @dob= data.dob
        mail(to: data.email_id , subject: "Your account has been created" )
    end

    def login_alert(data)
        @fname= data.first_name
        @lname= data.last_name
        @email= data.email_id
        @mobile= data.mobile
        @dob= data.dob
        mail(to: "imrozsamad@gmail.com", subject: "ALERT- An account activity was found.")
    end

    def forget_password_alert(data)
        @fname= data.first_name
        @lname= data.last_name
        @email= data.email_id
        @mobile= data.mobile
        @dob= data.dob
        mail(to: "imrozsamad@gmail.com", subject: "ALERT- An account activity was found.")
    end

end
