include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :entry do
    headline "Some Headline"
    description "Some Description"
    image { fixture_file_upload('db/fixtures/dummy.png', 'image/png') }
    url "http://some.url"
    sequence(:uuid) { |n| "0000-0000-0000-0#{n}" }
    major "0"
    minor "1"
  end
end