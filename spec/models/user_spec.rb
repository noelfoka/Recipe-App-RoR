require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Binod', email: 'bb@email.com', password: 'password') }
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a password' do
    user = User.create(name: 'Binod', email: 'bb@email.com')
    expect(user).not_to be_valid
  end
  it 'is not valid with the duplicate email' do
    User.create(name: 'Alice', email: 'alice@example.com', password: 'password')
    user = User.new(name: 'Eva', email: 'alice@example.com', password: 'password')
    expect(user).not_to be_valid
  end
  it 'is valid with a unique email' do
    User.create(name: 'Charlie', email: 'charlie@example.com', password: 'password')
    user = User.new(name: 'Grace', email: 'grace@example.com', password: 'password')
    expect(user).to be_valid
  end
end
