class AdminNotification < ActionMailer::Base
  default from: "sarah@deejbase.com"

  def new_user(user)
    mail(to: "strohsm88@gmail.com", subject: user.name + " signed up!")
  end

  def new_review(user, resource)
    mail(to: "strohsm88@gmail.com", subject: "#{user.name} reviewed #{resource.name}")
  end
end
