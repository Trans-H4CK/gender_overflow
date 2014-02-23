module Votable
  extend ActiveSupport::Concern

  included do
    has_many :up_votes, :class_name => "UpVote", :as => :votable
    has_many :down_votes, :class_name => "DownVote", :as => :votable
  end

  def votes
    up_votes.count - down_votes.count
  end

end
