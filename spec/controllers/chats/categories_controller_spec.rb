require 'spec_helper'

describe Chats::CategoriesController do

  describe "GET show" do
    before do
      @category = mock_model(Category) do |q|
        q.stub(:id) { '1' }
      end
      Category.should_receive(:find).with('1').and_return(@category)
    end

    context 'authorized' do
      before do
        should_authorize(:chat, @category)
        get :show, :id => @category.id
      end

      it "assigns the requested category as @category" do
        assigns(:category).should eq(@category)
      end
    end

    context 'not authorized' do
      before do
        should_not_authorize(:chat, @category)
        get :show, :id => @category.id
      end

      it "assigns the requested category as @category" do
        verify_authorization_unsuccessful
      end
    end
  end

end
