module DeviseExtraTestHelper

  def current_user(stubs = {})
    return nil if current_user_session.nil?
    current_user_session.user
  end

  alias :current_person :current_user

  def current_user_session(stubs = {}, user_stubs = {})
    @current_user_session = UserSession.find
    # else
    #   @current_user_session ||= mock_model(UserSession, {:person => current_user(user_stubs)}.merge(stubs))
    # end
  end

  def login_as(user)
    user = case user
           when Symbol
             FactoryGirl.create(user)
           when String
             FactoryGirl.create(user.to_sym)
           when User
             user
           else
             raise "Could not figure out login_as mapping for #{user.inspect}"
           end
    sign_in user
    user
  end
  alias authenticate login_as

  def logout
    sign_out :user
  end

  def verify_authorization_successful
    response.should_not redirect_to("/users/sign_in")
    response.should_not redirect_to(login_path)
  end

  def verify_authorization_unsuccessful
    if subject.current_user
      response.should redirect_to(root_path)
    else
      response.should be_redirect
      [login_url, request.protocol + request.host_with_port + "/users/sign_in"].should include(response.location)
    end
  end

end

module RSpec::Rails::ControllerExampleGroup
  include DeviseExtraTestHelper
end

module RSpec::Rails::ViewExampleGroup
  include DeviseExtraTestHelper
end

module RSpec::Rails::HelperExampleGroup
  include DeviseExtraTestHelper
end