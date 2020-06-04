FactoryBot.define do
  factory :appointment do
    appointment_type { "MyString" }
    appointment_time { "2020-06-12 09:30:00 UTC" }
    client_id { FactoryBot.create(:client).id }
  end
end
