require_relative '../acceptance_helper'

describe 'Home Page' do  
  context 'checking for login' do
    it "lets you in if you're logged in" do
      visit '/'
      expect(page).to have_content "Login"
    end
  end
end

describe 'User Creation' do
	describe 'Successful creation' do
		before do
			visit '/'
			find('#create-name').set('oscar')
			find('#create-pass').set('grouch')
		end

		it 'should increase user count by one' do
			expect { click_button "Create Account" }.to change(User, :count).by(1)
		end
	end
end

describe 'User Authorization' do
	describe 'Successful login' do
		let(:user) { FactoryGirl.create(:user) }

		before do
			visit '/'
			find('#login-name').set(user.name)
			find('#login-pass').set(user.password)
			click_button "Login" 
		end

		it 'should allow me to see my user page' do
			expect(page).to have_content("Welcome ".concat(user.name))
		end
	end

	describe 'Failed login' do
		let(:user) { FactoryGirl.create(:user) }

		before do
			visit '/'
			find('#login-name').set(user.name)
			find('#login-pass').set('fail')
			click_button "Login"
		end

		it 'should show me failed login' do
			expect(page).to have_content("unauthorized")
		end
	end
end