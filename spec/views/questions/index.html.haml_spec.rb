require 'spec_helper'

describe "questions/index" do
  before(:each) do
    @questions = (1..2).map do |n|
      stub_model(Question) do |q|
        q.question = "MyText"
        q.category = nil
      end
    end
    assign(:questions, @questions)
  end

  it "renders the edit question form" do
    render
  end
end
