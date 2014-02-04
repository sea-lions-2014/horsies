require_relative '../spec_helper'
require 'app/controllers/quiz_routes'

describe Deck, 'routes' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def stub_session
    {
      'rack.session' => {
        :user_id => user.id,
        :card_id => card.id
      }
    }
  end

  def stub_params
    { guess: 'AnSwEr' }
  end

  let(:deck){ create(:deck) }
  let(:card){ create(:card) }
  let(:user){ create(:user) }

  context "when we post a result" do
    it "records a score and advances to the next card" do
      expect {
        post "/deck/#{deck.id}/quiz/0", stub_params, stub_session
      }.to change(Score, :count).by(1)
      expect(last_response).to be_ok
      last_response.body.should match(/Incorrect!/)
    end
  end
end

