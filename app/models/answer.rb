class Answer < ActiveRecord::Base
  include Votable

  belongs_to :question
  belongs_to :user
end
