FactoryBot.define do
  factory :event do
    name { "A rad sick event!" }
    location { "Where rad sick events take place!" }
    date { Time.now }
    created_by { 1 }
  end
end
