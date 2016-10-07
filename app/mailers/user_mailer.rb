class UserMailer < ApplicationMailer

  def activation_email(user)
    @user = user
    @token = user.activation_token
    mail(to: user.email, subject: "Activate Your Account")
  end
end
