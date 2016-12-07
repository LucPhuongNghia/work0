require "rails_helper"

RSpec.feature "Sign in user" do
    before do
       @john = User.create(first_name: "john", last_name: "Doe", 
                            email: 'john@example.com', password: 'password') 
    end
    
    scenario "With valid credentials" do
        visit "/"
        
        click_link "Sign in"
        fill_in "Email", with: "john@example.com"
        fill_in "Password", with: "password"
        click_button "Log in"
        
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{@john.email}")
    end
    
end