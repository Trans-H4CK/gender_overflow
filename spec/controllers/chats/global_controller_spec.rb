require 'spec_helper'

describe Chats::GlobalController do

  describe "GET show" do

    context 'authorized' do
      before do
        should_authorize(:show, :global_chat)
        get :show
      end

      it "succeeds" do
        response.should be_success
      end
    end

    context 'not authorized' do
      before do
        should_not_authorize(:show, :global_chat)
        get :show
      end

      it "assigns the requested category as @category" do
        verify_authorization_unsuccessful
      end
    end
  end

end
