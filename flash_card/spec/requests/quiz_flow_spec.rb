require_relative '../acceptance_helper'

describe 'Quiz Flow' do
	let(:user) { FactoryGirl.create(:user) }

	before :each do
		valid_signin user
	end

	describe 'should be able to initiate a quiz from a created deck' do
		before do
			@deck = FactoryGirl.create(:deck, user: user)
			@cards = []
			3.times do |n|
				card = FactoryGirl.create(:card)
				card.cardecks.build(deck_id: @deck.id).save
				@cards << card
			end
			click_link "Decks"
			click_link @deck.name
		end

		it 'should have a link to initiate quiz' do
			expect(page).to have_link("Quiz yourself on this deck")
		end

		describe 'answering questions' do
			before :each do
				click_link "Quiz yourself on this deck"
			end

			it 'should have the first question of the deck' do
				expect(page).to have_content(@cards.first.question)
			end

			describe 'correct answer' do
				before do
					fill_in "guess", with: @cards.first.answer
					click_button "Submit"
				end

				it 'should have correct message' do
					expect(page).to have_content "Correct!"
				end

				it 'should have button to next question' do
					expect(page).to have_button "Next Question"
				end
			end

			describe 'incorrect answer' do
				before do
					fill_in "guess", with: "#{@cards.first.answer} wrong"
					click_button "Submit"
				end

				it 'should have incorrect message' do
					expect(page).to have_content "Incorrect!"
				end

				it 'should have button to next question' do
					expect(page).to have_button "Next Question"
				end
			end

			describe 'final score' do
				before do
					@accuracy = @cards.map{ |card| rand(2) }
					@num_right = @accuracy.reduce(:+)
					@cards.each_with_index do |card, index|
						fill_in "guess", with: (@accuracy[index] == 1 ? card.answer : "wrong#{card.answer}")
						click_button "Submit"
						click_button("Next Question") unless index == (@cards.length - 1)
					end
				end

				it 'should have a link back to user page' do
					expect(page).to have_link "Back"
				end

				it 'should show number correct' do
					expect(page).to have_content @num_right
				end
			end
		end
	end
end