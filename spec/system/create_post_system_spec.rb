RSpec.describe "Post creation", type: :system do

  before do
    user = create(:user)
    sign_in user
  end

  context 'When a logged in user creates a post' do
    it 'shows up on the page' do
      example_title =  'A Title Ha!'
      example_body = 'All People Seem To Need Data Processing'

      visit root_path
      fill_in "post_title", with: example_title
      fill_in "post_body", with: example_body
      click_on "Create Post"
      
      expect(page).to have_content(example_title)
      expect(page).to have_content(example_body)
    end
  end
end