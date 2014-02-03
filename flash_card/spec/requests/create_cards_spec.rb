require_relative '../acceptance_helper'

describe 'Deck management' do
	let(:user) { FactoryGirl.create(:user) }

	before :each do
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

		describe 'create a new deck' do
			let(:new_deck_title) { "new deck" }

			before do
				click_link "Create a new deck"
				fill_in 'deck_name', with: new_deck_title
				click_button "Create!"
			end

			it 'should show success message' do
				expect(page).to have_content("You have made a deck!")
			end

			it 'should have a link back to the deck list' do
				expect(page).to have_content("Back")
			end

			describe 'return to new deck list' do
				before do
					click_link "Back"
				end

				it 'should return you to the deck list' do
					expect(page).to have_content("Create a new deck")
				end

				it 'should show the new deck created' do
					expect(page).to have_content(new_deck_title)
				end
			end
		end

		describe 'add cards to a deck' do
			before do
			end

			
		end
	end
end