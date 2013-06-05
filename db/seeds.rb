require 'faker'

20.times do
  Url.create!(:long_url => "http://" + Faker::Internet.domain_name,
              :short_url => SecureRandom.hex(10) )
end