require_relative '../acceptance_helper'

describe 'Home Page' do  
  context 'checking for login' do
    it "lets you in if you're logged in" do
      visit '/'
      expect(page).to have_content "Login"
    end
  end
end


end