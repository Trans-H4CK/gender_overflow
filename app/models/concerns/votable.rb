module Votable
  extend ActiveSupport::Concern

  included do
    has_many :up_votes, :class_name => "UpVote", :as => :votable
    has_many :down_votes, :class_name => "DownVote", :as => :votable
  end

  def votes
    up_votes.count - down_votes.count
  end

  def has_voted(user)
    if id
      my_vote(user).present?
    else
      false
    end
  end

  def vote_type(user)
    vote = my_vote(user)
    vote && vote.class.to_s
  end

  def switch_vote(user)
    vote = my_vote(user)
    if vote
      vote_type = vote.class.to_s
      vote.destroy
      if vote_type == "UpVote"
        down_vote(user)
      else
        up_vote(user)
      end
    end
  end

  def my_vote(user)
    Vote.where(:user_id => user.id, :votable_id => id, :votable_type => self.class.to_s).first
  end

  def up_vote(user)
    up_votes << UpVote.new(:user => user)
    save
  end

  def down_vote(user)
    down_votes << DownVote.new(:user => user)
    save
  end

  module ClassMethods
    def by_vote_count
      all.sort_by{|answer| -answer.votes}
    end
  end
end
