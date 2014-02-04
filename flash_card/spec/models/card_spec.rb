require_relative '../spec_helper'

describe Card do
  before do
    @card = Card.create(question: 'question', answer: 'answer')
  end

  subject { @card } 


  it { should respond_to(:question) }
  it { should respond_to(:answer) }
  it { should respond_to(:decks) }
  it { should respond_to(:add_to_deck!) }

  describe "card deck association" do
    let(:deck) { FactoryGirl.create(:deck) }
    let(:cardeck) { @card.cardecks.build(deck_id: deck.id) }

    subject { cardeck }

    it { should be_valid }
    its(:card) { should eq @card }
    its(:deck) { should eq deck }
  end

  it "should accumulate a deck" do
    deck = FactoryGirl.create(:deck)

    @card.add_to_deck!(deck)
    @card.decks.should_not be_empty
    @card.decks.should include(deck)
  end

end

describe Deck do
  before do
    @deck = Deck.new(name: 'Kevin')
  end

  subject { @deck }

  it { should respond_to(:name) }
end
