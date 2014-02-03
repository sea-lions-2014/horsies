require_relative '../acceptance_helper'

describe 'Deck management' do
	let(:user) { FactoryGirl.create(:user) }

	before do
		valid_signin user
	end

	describe 'view all decks once logged in' do
		before do
			@deck = FactoryGirl.create(:deck, user: user)
			click_link "Decks"
		end

		it 'should show all decks' do
			expect(page).to have_content(@deck.name)
		end

		it 'should have a link to create a new deck' do
			expect(page).to have_content("new deck")
		end
	end

end