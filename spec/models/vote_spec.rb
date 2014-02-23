require 'spec_helper'

describe Vote do
  it { should have_db_column(:type) }
  it { should belong_to(:user) }
  it { should belong_to(:votable) }

  describe "validation" do
    describe "one vote per item per user" do
      user = FactoryGirl.create(:user)
      answer = FactoryGirl.create(:answer)
      other_answer = FactoryGirl.create(:answer)
      down_vote = DownVote.create!(:user => user, :votable => answer)
      up_vote = UpVote.new(:user => user, :votable => answer)
      up_vote.valid?.should == false
      up_vote.votable = other_answer
      up_vote.valid?.should == true
    end
  end

end