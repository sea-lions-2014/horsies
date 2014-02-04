class Deck < ActiveRecord::Base
  has_many :cardecks
	has_many :cards, through: :cardecks
	belongs_to :user
  has_many :scores

  def user_has_no_score_for_me?(user)
    Score.where(user_id: user.id, deck_id: self.id).empty?
  end

  def get_score_for_user(user)
    if user_has_no_score_for_me?(user)
      Score.create(user_id: user.id, deck_id: self.id, value: 0)
    else
      Score.where(user_id: user.id, deck_id: self.id).last
    end
  end

  def initalize_session_score!(params, session)
    session[:score] = 0 if params[:num].to_i == 0 #set session score value to zero if on the first question
  end


  def track_guess(params, user, session)
    @score = get_score_for_user(user)
    initalize_session_score!(params, session)
    @top_card = Card.find(session[:card_id])
    @correct = params[:guess].downcase == @top_card.answer.downcase ? true : false
    session[:score] += 1 if @correct # add one to score if correct
    @score.update_attributes(value: session[:score])
  end

  def last_question?(card_number)
    card_number == self.cards.length - 1
  end
end
