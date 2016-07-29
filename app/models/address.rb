require 'geocoder'

class Address < ActiveRecord::Base
  include Geocoder
  belongs_to :user

  validates_presence_of :street, :city, :state
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates



  def full_street_address
    [self.street, self.city, self.state, self.zip].compact.join(', ')
  end

end
