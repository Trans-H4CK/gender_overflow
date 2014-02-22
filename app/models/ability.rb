class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin
          can :manage, :all
      elsif user
        can :create, Question
        can :update, Question, :user_id => user.id
        can :create, Answer
        can :update, Answer, :user_id => user.id
        can :manage, User, :id => user.id
      end
    end
    can :read, Question
    can :read, Answer
  end
end
