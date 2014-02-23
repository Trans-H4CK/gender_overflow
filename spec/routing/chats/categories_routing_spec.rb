require 'spec_helper'

describe Chats::CategoriesController do
  describe 'routing' do
    it "routes to #show" do
      get("/chats/categories/1").should route_to(
        :controller => "chats/categories",
        :action => "show",
        :id => "1")
    end
  end
end
