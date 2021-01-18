require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is not valid without attributes" do
    expect(Event.new).to_not be_valid
  end
  it "is not valid without a name" do
    expect(Event.new(location:"This is a test!", date:Time.now, created_by:1)).to_not be_valid
  end
  it "is not valid without a location" do
    expect(Event.new(name:"Majestic Event 1", date:Time.now, created_by:1)).to_not be_valid
  end
  it "is not valid without a date" do
    expect(Event.new(name:"Majestic Event 1", location:"Managua, Nicaragua", created_by:1)).to_not be_valid
  end
  it "is not valid without a created_by" do
    expect(Event.new(name:"Majestic Event 1", location:"Managua, Nicaragua", date:Time.now)).to_not be_valid
  end
end
