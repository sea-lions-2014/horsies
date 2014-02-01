require_relative 'spec_helper'

describe Card do
  describe "card creation" do
    before do
      @card = Card.new(question: 'what is andys age', answer: '19')
    end

    it "should have an answer" do
      expect(@card.answer).to eq ('19')
    end

    it "should have a question" do
      expect(@card.question).to eq ('what is andys age')
    end
  end

end

describe Deck do
  describe "deck creation" do
    before do
      @deck = Deck.new(name: 'Kevin')
    end

    it "should have a name" do
      expect(@deck.name).to eq ('Kevin')
    end
  end
end