require 'net/http'
require 'uri'

class Url < ActiveRecord::Base

  before_save :generate_short_url 

  validates_presence_of :long_url
  # validates_each :long_url do |record, attr, value|
  #   p "record: #{record}, attr: #{attr}, value: #{value}"
  #   record.errors.add(attr, 'must be a valid URI') if valid_url?(value)
  # end

  def generate_short_url
    self.short_url = SecureRandom.hex(10)
  end

  def full_short_url
    "localhost:9393/" + self.short_url
  end

  # def self.valid_url?(value)
  #   #uri = URI(value)
  #   p "value: #{value}"
  #   response = Net::HTTP.request_head(value)
  #   response.code == "200"
  # end

  #1. check that long form url is valid before saving to db
  #2. generate short_url from that long url and save to db
  #3. 

end