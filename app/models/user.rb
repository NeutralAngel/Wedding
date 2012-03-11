class User < ActiveRecord::Base
  belongs_to :rsvp
  has_secure_password
  validates_presence_of :password, :on => :rsvp#create
  validates :email, :uniqueness => {:message => "login"}, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
