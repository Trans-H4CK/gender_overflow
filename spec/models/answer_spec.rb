require 'spec_helper'

describe Answer do
  it { should have_db_column(:answer) }
  it { should have_db_column(:youtube_id)}
  it { should_not have_db_column(:cheese) }
  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should have_many(:up_votes) }
  it { should have_many(:down_votes) }

  describe "youtube_url" do
    it "assignment" do
      answer = Answer.new
      answer.youtube_url = "http://youtu.be/JBbnjGnc2II"
      answer.youtube_id.should == "JBbnjGnc2II"
    end

    it "retrieval" do
      answer = Answer.new
      answer.youtube_id = "JBbnjGnc2II"
      answer.youtube_url.should == "http://youtu.be/JBbnjGnc2II"
    end
  end

end
