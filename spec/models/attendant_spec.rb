require 'rails_helper'

RSpec.describe Attendant, type: :model do
  it 'is not valid without attributes' do
    expect(Attendant.new).to_not be_valid
  end
  it 'is not valid with string as event_id' do
    expect(Attendant.new(event_id: '1', user_id: 1)).to_not be_valid
  end
  it 'is not valid with string as user_id' do
    expect(Attendant.new(event_id: 1, user_id: '1')).to_not be_valid
  end
  it 'is not valid without user_id' do
    expect(Attendant.new(event_id: 1)).to_not be_valid
  end
  it 'is not valid without event_id' do
    expect(Attendant.new(user_id: 1)).to_not be_valid
  end
end
