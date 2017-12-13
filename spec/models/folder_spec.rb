require 'rails_helper'

RSpec.describe Folder, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Folder One"
    subject.user_id = 1
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.name = "Folder One"
    expect(subject).to_not be_valid
  end
end
