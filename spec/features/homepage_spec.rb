require "rails_helper"

RSpec.feature "Create homepage" do
    scenario do
        visit '/'
        
        expect(page).to have_link('Athletes')
        expect(page).to have_link('Home')
        expect(page).to have_content('Workout lounge!')
        expect(page).to have_content('Show your workout')
    end
    
end