class StaticController < ApplicationController
  def index
    @activities = last_activities(5)
  end

  def last_activities(num)
    questions = Question.order("created_at DESC").limit(num)
    answers = Answer.order("created_at DESC").limit(num)
    (questions + answers).sort_by(&:created_at).reverse.first(num)
  end

end