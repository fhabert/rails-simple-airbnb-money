class UserMailer < ApplicationMailer
    default from: 'f.habert19@ejm.org'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to my App')
    end
end
