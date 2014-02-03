require_relative '../spec_helper'

describe User do
  before do
    @user = User.create(name: 'oscar', password: 'grouch')
  end

  subject { @user } 

  it { should respond_to(:name) }
  it { should respond_to(:password) }

  describe "user deck association" do
    let(:deck) { FactoryGirl.create(:deck) }

    before do
      @user.decks << deck
    end

    subject { @user }

    it { should be_valid }
    its(:decks) { should include(deck) }
  end
end