class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :questions

  def all_questions
    Question.where(:category_id => self_and_descendants.map(&:id))
  end
end
