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
        can :vote, Answer
        can :manage, User, :id => user.id
        can :chat, Category
        can :show, :global_chat
      end
    end
    can :read, Category
    can :read, Question
    can :read, Answer
  end
end
