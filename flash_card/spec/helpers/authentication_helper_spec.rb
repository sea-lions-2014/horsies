require_relative '../acceptance_helper'

describe AuthenticationHelper do

	describe 'Successful login' do
		let(:user) { FactoryGirl.create(:user) }

		before do
			valid_signin user
		end

		it 'should sucessfully login the user' do
			expect(page).to have_content("welcome, ".concat(user.name))
		end
	end
end