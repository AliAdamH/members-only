require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'Validations' do

    it 'requires and email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'requires a valid  password' do
      expect(build(:user, :invalid_password)).not_to be_valid
    end

    it 'requires a username' do
      expect(build(:user, username: nil)).not_to be_valid
    end

    it 'requires a name' do
      expect(build(:user, name: nil)).not_to be_valid
    end
  end

  context 'Associations' do
    it 'has many posts' do
      expect(described_class.reflect_on_association(:posts).macro).to eq(:has_many)
    end
  end
end
