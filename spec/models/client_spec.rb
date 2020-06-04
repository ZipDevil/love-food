require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { Client.new(first_name: "Joe",
                       last_name: "Smith",
                       phone: "2223456789",
                       email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    subject.phone="1"
    expect(subject).to_not be_valid
    subject.phone="12345678901"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
    subject.phone="a123b456c7"
    expect(subject).to_not be_valid
    subject.phone="123456!@*%"
    expect(subject).to_not be_valid
  end
  it "is not valid if the email address doesn't have a @" do
    subject.phone="abc-gmail.com"
    expect(subject).to_not be_valid
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Joe Smith")
  end
end
