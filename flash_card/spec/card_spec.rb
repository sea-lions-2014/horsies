require_relative 'spec_helper'

describe Card do
  describe "card creation" do
    let(:deck) { Deck.create(name: 'Andy') }
    let(:card) { Card.new(question: 'what is andys age', answer: '19') }


    it "should have an answer" do
      expect(card.answer).to eq ('19')
    end

    it "should have a question" do
      expect(card.question).to eq ('what is andys age')
    end

    it "should belong to one or more decks" do
      expect(card.decks.first).to eq (@deck)
    end
  end

  describe "card deck association" do
    let(:deck) { Deck.create(name: 'Andy') }
    let(:card) { Card.create(question: 'what is andys age', answer: '19') }

    before :each do
      card.decks << deck
    end

    it "should have access to deck" do
      expect(card.decks.first.name).to eq('Andy')
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
