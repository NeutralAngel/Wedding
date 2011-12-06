class NewRsvpMailer < ActionMailer::Base
  default :from => "nathan.nontell@gmail.com"

  def new_rsvp_created(rsvp)
    @rsvp = rsvp
    mail(:to => ["nathan.nontell@gmail.com","julianne.e.thompson@gmail.com"], :subject => "New RSVP created!")
  end
end
