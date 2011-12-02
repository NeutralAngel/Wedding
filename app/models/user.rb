class User < ActiveRecord::Base
  belongs_to :rsvp
  has_secure_password
  validates_presence_of :password, :on => :rsvp#create
end
