require 'spec_helper'

describe Category do
  it { should have_db_column(:name) }
  it { should have_db_column(:lft) }
  it { should have_db_column(:rgt) }
  it { should have_db_column(:parent_id) }
  it { should have_many(:questions) }

  describe "all questions" do
    let :parent do
      FactoryGirl.create(:category)
    end

    let :children do
      (1..2).map do
        FactoryGirl.create(:category, :parent => parent)
      end
    end

    let :parent_question do
      FactoryGirl.create(:question, :category => parent)
    end

    let :child_questions do
      children.map do |child|
        FactoryGirl.create(:question, :category => child)
      end
    end

    before do
      parent_question
      child_questions
    end

    subject do
      parent.reload.all_questions
    end

    it { should include(parent_question) }
    it "should include children" do
      child_questions.each do |child_question|
        subject.should include(child_question)
      end
    end
  end
end