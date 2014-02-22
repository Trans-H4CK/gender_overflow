require "spec_helper"

describe 'user routing' do
  describe "routing" do

    it "login" do
      get("/login").should route_to("devise/sessions#new")
    end

    it "logout" do
      delete("/logout").should route_to("devise/sessions#destroy")
    end

    it "sign_up" do
      get("/sign_up").should route_to("devise/registrations#new")
    end

    it "reset password" do
      get("/reset_password").should route_to("devise/passwords#new")
    end

  end
end
