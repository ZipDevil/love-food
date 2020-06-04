FactoryBot.define do
  factory :message do
    title { "MyString" }
    body { "MyString" }
    helper { false }
    client { nil }
  end
end
