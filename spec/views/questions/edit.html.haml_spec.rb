require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "MyText",
      :category => nil,
      :user => nil
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "textarea#question_question[name=?]", "question[question]"
      assert_select "input#question_category[name=?]", "question[category]"
      assert_select "input#question_user[name=?]", "question[user]"
    end
  end
end
