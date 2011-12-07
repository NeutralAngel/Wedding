class NewRsvpMailer < ActionMailer::Base
  default :from => "nathan.nontell@gmail.com"

  def new_rsvp_created(rsvp)
    @rsvp = rsvp
    mail(:to => ["nathan.nontell@gmail.com","julianne.e.thompson@gmail.com"], :subject => "New RSVP created!")
  end

  def new_user_created(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Thanks for RSVPing!")
  end
end
