FactoryBot.define do
  factory :upload do
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'image/jpeg') }
    metadata {}
    user_id { Faker::Number.number(10) }
  end
end