class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validate :no_voting_twice

  def no_voting_twice
    if user_id and votable_id
      if self.class.base_class.where(:user_id => user_id, :votable_id => votable_id, :votable_type => votable_type).present?
        errors.add(:base, "You can only vote once!")
      end
    end
  end

end
