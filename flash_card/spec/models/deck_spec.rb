require_relative '../spec_helper'

describe Deck do
  before do
    @deck = Deck.new(name: 'Kevin')
  end

  subject { @deck }

  it { should respond_to(:name) }
end
