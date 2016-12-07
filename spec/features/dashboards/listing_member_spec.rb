require "rails_helper"

RSpec.feature "Listing member" do
    before do
        @john = User.create(first_name: "John",
                            last_name: "Doe",
                            email: "john@example.com",
                            password: "password")
                            
        @sarah = User.create(first_name: "Sarah",
                             last_name: "Jones",
                             email: "sarah@example.com",
                             password: "password")
    end
    
    scenario do
       visit "/"
       
       expect(page).to have_content("Member List")
       expect(page).to have_content(@john.full_name)
       expect(page).to have_content(@sarah.full_name)
    end
end