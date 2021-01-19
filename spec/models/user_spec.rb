require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without attributes' do
    expect(User.new).to_not be_valid
  end
  it 'is not valid with empty string as username' do
    expect(User.new(username: '')).to_not be_valid
  end
end
