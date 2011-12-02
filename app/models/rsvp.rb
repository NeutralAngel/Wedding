class Rsvp < ActiveRecord::Base
  has_one :user
  has_many :guests
  accepts_nested_attributes_for :user, :guests, :allow_destroy => true
end
