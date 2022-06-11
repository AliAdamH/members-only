require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do

  describe "#display_icon" do
    context 'When the user is signed in' do
      before do
        user = create(:user)
        sign_in user
      end
      it 'returns the icon given in the params' do
        returned_icon = helper.display_icon('hello')
        expect(returned_icon).to eq('hello')
      end
    end

    context 'When the user isnt signed in' do
      it 'always returns fa-lock' do
        returned_icon = helper.display_icon('ANYTHING')
        expect(returned_icon).to eq('fa-lock')
      end 
    end
  end


  describe '#owner?' do
    before do
      user = create(:user)
      sign_in user
    end
    context 'When the current user is the posts author' do
      it 'returns true' do
        post = create(:post, user: User.last)
        expect(helper.owner?(post)).to be true
      end
    end

    context 'When the current user is NOT the post author' do
      it 'returns false' do
        post = create(:post)
        expect(helper.owner?(post)).to be false
      end
    end
  end


  describe "#profile_picture" do
    context 'When the user is signed in' do
      before do
        user = create(:user)
        sign_in user
      end
      
      it 'returns the smiley picture' do
        expect(helper.profile_picture).to eq '/smiley.png'
      end
    end

    context 'When the user is NOT signed in' do
      it 'returns the anonymous picture' do
        expect(helper.profile_picture).to eq '/spy.png'
      end
    end
  end
end