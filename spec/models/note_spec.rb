require 'rails_helper'

RSpec.describe Note, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.title = "Note One"
    subject.user_id = 1
    subject.folder_id = 1
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.title = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a folder_id" do
    subject.title = "Anything"
    subject.user_id = 1
    expect(subject).to_not be_valid
  end
end
