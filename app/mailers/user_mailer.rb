class UserMailer < ActionMailer::Base
  default from: "from@letstalk.com"
  
  def welcome_email(user)
     @user = user
     @url = "https://peaceful-badlands-9029.herokuapp.com/"
     mail(to: @user.email, subject: 'Welcome to LETS TALK')
  end

end
