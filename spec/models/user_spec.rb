require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(email: 'user@email', password: '753951')
    expect(user).to_not be_valid
  end

  it 'email should be present' do
    user = User.new(name: 'User', password: '753951')
    expect(user).to_not be_valid
  end

  it 'password should be present' do
    user = User.new(name: 'User', email: 'user@email')
    expect(user).to_not be_valid
  end

  it 'name, email, password should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951', reset_password_token: 'sdwie',
                    confirmation_token: 'sdjfi')
    expect(user).to be_valid
  end
end
