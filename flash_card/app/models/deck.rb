class Deck < ActiveRecord::Base
  has_many :cardecks
	has_many :cards, through: :cardecks
	belongs_to :user
  has_many :scores

  def user_has_no_score_for_me?(user)
    Score.where(user_id: user.id, deck_id: self.id).empty?
  end

  def track_guess(params, user, session)
    @score = Score.create(user_id: user.id, deck_id: params[:id].to_i, value: 0) if user_has_no_score_for_me?(user)
    session[:score] = 0 if params[:num].to_i == 0 #set session score value to zero if on the first question
    @score = Score.where(user_id: user.id, deck_id: params[:id].to_i).last # find the score object if you're not on the first question
    @top_card = Card.find(session[:card_id])
    @correct = params[:guess].downcase == @top_card.answer.downcase ? true : false
    session[:score] += 1 if @correct # add one to score if correct
    @score.update_attributes(value: session[:score])
  end

  def last_question?(card_number)
    card_number == self.cards.length - 1
  end
end
