class ContactDjMailer < ActionMailer::Base
  default from: "dj-wanted@djbase.com"

  def contact_dj(dj, message, email)
    @email=email
    @dj = dj
    @message = message
    mail(to: 'strohsm88@gmail.com', subject: @dj.name + ' contact requested')
  end

  def contact_us(email, message)
    @message = message
    @email = email
    mail(to: 'strohsm88@gmail.com', subject: 'contact form used!')
  end

  def price_inquiry(email, name)
    @name=name
    mail(to: email, subject: 'Booking '+name+ ' NYC.')
  end
end
# djs = Dj.is_dj.order('sdcl_followers ASC')[1..14]
# Dj.is_dj.each do |dj|
# ContactDjMailer.price_inquiry(dj.email, dj.name).deliver
# end