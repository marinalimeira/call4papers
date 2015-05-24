FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs(2) }
    date { Faker::Date.forward(23) }
    url { Faker::Internet.url }
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'events', 'logo', 'image.jpg')) }
    user
    end_date { Faker::Date.forward(50) }
  end
end
