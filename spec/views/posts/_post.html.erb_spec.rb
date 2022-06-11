RSpec.describe "post/_post.html_erb", type: :view do

  describe "Authenticated User" do

    before do
      user = create(:user)
      sign_in user
    end

    context 'Post belongs to user' do
      it 'shows the delete link' do
        user = User.last
        post = create(:post, user: user)
        render partial: 'posts/post.html.erb', locals: { post: post }
        expect(rendered).to have_selector('.fa-trash')
      end
    end

    context 'Post does not belong to the connected user' do
      let(:post) { create(:post) }
      it 'does NOT show the delete link' do
        render partial: 'posts/post.html.erb', locals: { post: post }
        expect(rendered).not_to have_selector('.fa-trash')
      end

      it 'only shows the like icon' do
        render partial: 'posts/post.html.erb', locals: { post: post }
        expect(rendered).to have_selector('.fa-heart')
      end
    end
  end

  describe 'Unauthenticated User' do
    it 'shows post authors as [REDACTED]' do
      post = create(:post)
      render partial: 'posts/post.html.erb', locals: { post: post }
      expect(rendered).to have_content('[REDACTED]')
    end
  end
end