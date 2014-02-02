require_relative 'acceptance_helper'

describe 'URLs that require login' do  
  context 'the /mystore URL' do
    it "lets you in if you're logged in" do
      visit '/'
      expect(page).to have_link "Create a new deck"
    end
  end
end