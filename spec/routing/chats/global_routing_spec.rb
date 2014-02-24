require 'spec_helper'

describe Chats::GlobalController do
  describe 'routing' do
    it "routes to #show" do
      get("/chats/global").should route_to(
        :controller => "chats/global",
        :action => "show")
    end
  end
end
