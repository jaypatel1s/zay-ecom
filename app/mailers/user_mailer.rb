class UserMailer < ApplicationMailer
  default from: 'rauttejas066@gmail.com'

  def login_email(user)
    @user = user
    mail(to: @user.email, subject: "logged in as #{user.email}")
  end
           
  def logout_email(user)
    @user = user
    mail(to: @user.email, subject: "logged out as #{@user.email}")
  end

  def welcome_email
    @user = params[:user]
    @url =  'http://127.0.0.1:3000/users/sign_in'
    mail(to: @user.email, subject:"Welcome to my awesome site")
  end
end
