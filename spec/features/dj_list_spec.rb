require_relative "../rails_helper.rb"

describe "Dj List", :type => :feature do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content 'DJ List'
  end
  it 'let\'s you log in with facebook'
    click_link ' Sign in with Facebook'

  end
end