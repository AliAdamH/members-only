require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Associations' do

    it 'belongs to a user' do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'is not valid without a user' do
      post = build(:post, user: nil)
      expect(post).not_to be_valid
    end

    it 'is valid when associated with a user' do
      post = build(:post)
      expect(post).to be_valid
    end
  end


  context 'Validations' do
    it 'is invalid if attributes are blank' do
      post = build(:post, :blank_invalid)
      expect(post).not_to be_valid
    end


    it 'is invalid if the title is too long (greater than 30 chars)' do
      post = build(:post, :title_length_invalid)
      expect(post).not_to be_valid
    end

    it 'is invalid if the body is too long (greater than 256 chars)' do
      post = build(:post, :body_length_invalid)
      expect(post).not_to be_valid
    end
  end
end
