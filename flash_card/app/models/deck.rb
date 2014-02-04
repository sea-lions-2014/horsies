class Deck < ActiveRecord::Base
  has_many :cardecks
	has_many :cards, through: :cardecks
	belongs_to :user
  has_many :scores

  def track_guess(guess_text, user, card_id)
    @score = get_score_for_user(user)
    @card = Card.find(card_id)
    if (correct = @card.correct_guess?(guess_text))
      @score.increment!(:value)
    end
    correct
  end

  def last_question?(card_number)
    card_number == self.cards.length - 1
  end

  private

    def get_score_for_user(user)
      if Score.where(user_id: user.id, deck_id: self.id).empty?
        Score.create(user_id: user.id, deck_id: self.id, value: 0)
      else
        Score.where(user_id: user.id, deck_id: self.id).last
      end
    end
end
