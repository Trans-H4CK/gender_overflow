require 'spec_helper'

describe AnswersController do
  describe "routing" do

    it "routes to #new" do
      get("/questions/1/answers/new").should route_to(
        :controller => "answers",
        :action => "new",
        :question_id => '1')
    end

    it "routes to #edit" do
      get("/questions/1/answers/2/edit").should route_to(
        :controller => "answers",
        :action => "edit",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #create" do
      post("/questions/1/answers").should route_to(
        :controller => "answers",
        :action => "create",
        :question_id => '1')
    end

    it "routes to #update" do
      put("/questions/1/answers/2").should route_to(
        :controller => "answers",
        :action => "update",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #destroy" do
      delete("/questions/1/answers/2").should route_to(
        :controller => "answers",
        :action => "destroy",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #up_vote" do
      post("/questions/1/answers/2/up-vote").should route_to(
        :controller => "answers",
        :action => "up_vote",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #down_vote" do
      post("/questions/1/answers/2/down-vote").should route_to(
        :controller => "answers",
        :action => "down_vote",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #switch_vote" do
      put("/questions/1/answers/2/switch-vote").should route_to(
        :controller => "answers",
        :action => "switch_vote",
        :question_id => '1',
        :id => '2')
    end

    it "routes to #delete_vote" do
      delete("/questions/1/answers/2/delete-vote").should route_to(
        :controller => "answers",
        :action => "delete_vote",
        :question_id => '1',
        :id => '2')
    end

  end
end
