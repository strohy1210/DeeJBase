class ContactDjMailer < ActionMailer::Base
  default from: "dj-wanted@djbase.com"

  def contact_dj(dj, message, sender)
    @sender = sender
    @dj = dj
    @message = message
    mail(to: 'strohsm88@gmail.com', subject: @dj.name + 'contact requested')
  end

end
