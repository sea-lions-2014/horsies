require_relative '../spec_helper'
require 'app/controllers/deck_routes'

describe Deck, 'routes' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:deck){ create(:deck) }

  context "when there are no cards in a deck" do
    it "allow a card to be added to a deck" do

      expect{
        post "/deck/#{deck.id}/card", question: "Who is Heisenberg?", answer: "Walter White", deck_id: deck.id
      }.to change(Card, :count).by(1)
      expect(last_response).to be_ok
    end
  end
end
