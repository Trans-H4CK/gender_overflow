require 'spec_helper'

describe Votable do

  before :all do
    m = ActiveRecord::Migration.new
    m.verbose = false
    m.create_table :test_classes do |t|
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
end