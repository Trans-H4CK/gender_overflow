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

  end
end
