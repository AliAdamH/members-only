RSpec.describe "Posts", type: :request do

  before do
    user = build(:user)
    sign_in user
  end

  describe "POST /posts" do

    it 'creates the post' do
      post  posts_path(post: {title: "Sometitle", body: "Say things" })
      expect(response.status).to eq 302
    end


    context 'The attributes are invalid' do
      it 'returns a 422 response' do
        post_params = attributes_for(:post, :blank_invalid)
        post posts_path(post: post_params)
        expect(response.status).to eq 422
      end

      it 'returns errors within the response' do
        post_params = attributes_for(:post, :blank_invalid)
        post posts_path(post: post_params)
        expect(response.body).to include("Oops your post contains some errors")
      end
    end
  end


  describe "GET /posts" do

    it "renders index" do
      get posts_path
      expect(response).to render_template(:index)
    end

  end
end