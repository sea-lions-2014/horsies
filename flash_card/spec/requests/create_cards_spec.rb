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
				expect(page).to have_content("congratulations, you have made a new deck!")
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

		describe 'view a deck' do
			before do
				click_link @deck.name
			end

			it 'should have a link to add a card' do
				expect(page).to have_content("Add a new card")
			end

			describe 'add a card' do
				let(:question) { "test question" }
				let(:answer) { "test answer" }

				before do
					click_link "Add a new card to this deck"
					fill_in "question", with: question
					fill_in "answer", with: answer
				end

				it 'should save a card to the deck' do
					expect { click_button "Create!" }.to change(Card,:count).by(1)
				end

				describe 'new card confirmation' do
					before do
						click_button "Create!"
					end

					it 'should have a confirmation message' do
						expect(page).to have_content("You have made a card!")
					end

					it 'should have a link to go back to deck' do
						expect(page).to have_content("Go back to deck")
					end

					describe 'return to deck page' do
						before do
							click_link "Go back to deck"
						end

						it 'should show the question of the card created' do
							expect(page).to have_content(question)
						end
					end
				end
			end
		end
	end
end