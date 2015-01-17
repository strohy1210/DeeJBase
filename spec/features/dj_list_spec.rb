require_relative "../rails_helper.rb"

describe "Dj List", :type => :feature do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content 'DJ List'
  end
  it 'let\'s you log in with facebook' do
    visit '/'
    reset_session
    click_link ' Sign in with Facebook'
    request.env["omniauth.auth"] = mock_auth_hash
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Welcome'

  end
end

# if page.has_link?('name') do
#   page.click_link('name')
# end