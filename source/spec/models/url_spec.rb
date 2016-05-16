require 'rails_helper'

RSpec.describe Url, :type => :model do
  it "is valid with a name, short and count" do
    url = Url.new(
      name: 'test.com',
      short: 'abc123',
      count: 0)
    expect(url).to be_valid
  end
  
  it "is invalid without a name" do
    url = Url.new(name: nil)
    url.valid?
    expect(url.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid with a duplicate short" do
    Url.create(
      name: 'test0.com', count: 0,
      short: 'abc123'
    )
    url = Url.new(
      name: 'test.com', count: 0,
      short: 'abc123'
    )
    url.valid?
    expect(url.errors[:short]).to include("has already been taken")
  end
end
