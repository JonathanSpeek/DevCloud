require 'rails_helper'

RSpec.describe Upload, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Upload One"
    subject.user_id = 1
    subject.folder_id = 1
    subject.size = 5_000
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.name = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a folder_id" do
    subject.name = "Anything"
    subject.user_id = 1
    expect(subject).to_not be_valid
  end

  it "is not valid without a size" do
    subject.name = "Anything"
    subject.user_id = 1
    subject.folder_id = 1
    expect(subject).to_not be_valid
  end
end
