class User < ActiveRecord::Base
  belongs_to :rsvp
  has_secure_password
  validates_presence_of :password
  validates :email, :uniqueness => {:message => "login"}
end
