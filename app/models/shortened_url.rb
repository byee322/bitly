require 'uri'
class ShortenedUrl < ActiveRecord::Base
  # Remember to create a migration!
  # validates_uniqueness_of :url
  # validates_presence_of :url
   # validates_format_of :url, :with => URI::regexp(%w(http https www))
  before_create :generate_short_url

  def generate_short_url
  	self.short_url = loop do 
  		random_token = SecureRandom.urlsafe_base64(6,false)
  		break random_token unless ShortenedUrl.where(short_url: random_token).exists? 
  	end
  end
end
