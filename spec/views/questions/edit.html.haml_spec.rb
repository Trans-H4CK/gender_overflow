require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = stub_model(Question) do |q|
      q.question = "MyText"
      q.category = nil
    end
    assign(:question, @question)
  end

  it "renders the edit question form" do
    render
  end
end
