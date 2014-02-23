class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :category
  belongs_to :user

  validates_presence_of :category

end
