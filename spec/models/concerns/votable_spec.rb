require 'spec_helper'

describe Votable do

  before :all do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.create_table :test_classes do |t|
      t.boolean :awesome
    end
  end

  after :all do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.drop_table :test_classes
  end

  class TestClass < ActiveRecord::Base
    include Votable
  end

  it "calculate votes correctly" do
    test = TestClass.create!
    4.times do
      UpVote.create!(:votable => test)
    end
    2.times do
      DownVote.create!(:votable => test)
    end
    test.votes.should == 2
  end

  it "sorts by vote count" do
    less_votes = TestClass.create!(:awesome => true)
    2.times do
      DownVote.create!(:votable => less_votes)
    end
    more_votes = TestClass.create!(:awesome => true)
    4.times do
      UpVote.create!(:votable => more_votes)
    end
    other_votes = TestClass.create!(:awesome => false)
    2.times do
      UpVote.create!(:votable => other_votes)
    end
    TestClass.where(:awesome => true).by_vote_count.should == [more_votes, less_votes]
  end

  it "has voted" do
    user = FactoryGirl.create(:user)
    test_class = TestClass.create!
    test_class.has_voted(user).should == false
    up_vote = UpVote.create!(:user => user, :votable => test_class)
    test_class.has_voted(user).should == true
    up_vote.destroy
    test_class.has_voted(user).should == false
    down_vote = DownVote.create!(:user => user, :votable => test_class)
    test_class.has_voted(user).should == true
  end

  it "vote type" do
    user = FactoryGirl.create(:user)
    test_class = TestClass.create!
    up_vote = UpVote.create!(:user => user, :votable => test_class)
    test_class.vote_type(user).should == "UpVote"
    up_vote.destroy
    down_vote = DownVote.create!(:user => user, :votable => test_class)
    test_class.vote_type(user).should == "DownVote"
  end

  it "switch vote" do
    user = FactoryGirl.create(:user)
    test_class = TestClass.create!
    up_vote = UpVote.create!(:user => user, :votable => test_class)
    test_class.switch_vote(user)
    test_class.vote_type(user).should == "DownVote"
    test_class.switch_vote(user)
    test_class.vote_type(user).should == "UpVote"
  end
end