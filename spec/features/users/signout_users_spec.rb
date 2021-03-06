require "rails_helper"

RSpec.feature "Signout" do
    before do
        @john = User.create(first_name: "john", last_name: "Doe", 
                            email: 'john@example.com', password: 'password')
        visit '/'
        click_link "Sign in"
        fill_in "Email", with: 'john@example.com'
        fill_in "Password", with: 'password'
        click_button "Log in"
    end
    
    scenario "a login user" do
       visit '/'
       
       click_link "Sign out"
       expect(page).to have_content("Signed out successfully")
    end
end