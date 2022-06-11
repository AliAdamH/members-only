RSpec.describe "/posts/index.html.erb", type: :view do

  let(:posts) { Post.all }
  let(:post) { Post.new }

  before do
    assign(:posts, posts)
    assign(:post, post)
  end

  describe "Authenticated user" do

    before do
      user = create(:user)
      sign_in user
    end

    context 'When visiting the index page' do
      it 'shows the form for adding the posts' do
        render
        expect(rendered).to have_selector("#new_post")
      end
    end
  end


  describe 'Unauthenticated user' do
    context 'When visiting the index page' do
      it 'does NOT show the form for adding the posts' do
        render
        expect(rendered).not_to have_selector("#new_post")
      end
    end
  end
end