class User < ActiveRecord::Base
  belongs_to :rsvp
  has_secure_password
  validates_presence_of :password
  validates :email, :uniqueness => {:message => "login"}, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
