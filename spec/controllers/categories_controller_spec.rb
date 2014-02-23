require 'spec_helper'

describe CategoriesController do

  describe "GET index" do
    before do
      @category = mock(Category)
      Category.stub_chain(:root, :descendants).and_return([@category])
      should_authorize(:index, Category)
    end

    it "assigns all categories as @categories" do
      get :index
      assigns(:categories).should eq([@category])
    end
  end

  describe "GET show" do
    before do
      @category = mock_model(Category) do |q|
        q.stub(:id) { '1' }
      end
      should_authorize(:show, @category)
      Category.should_receive(:find).with('1').and_return(@category)
    end

    it "assigns the requested category as @category" do
      get :show, :id => @category.id
      assigns(:category).should eq(@category)
    end
  end

  describe "GET new" do
    before do
      @category = mock_model(Category)
      Category.should_receive(:new).and_return(@category)
    end

    context 'not authorized' do
      before do
        should_not_authorize(:new, @category)
      end

      it "should not be authorized" do
        get :new
        verify_authorization_unsuccessful
      end
    end

    context 'authorized' do
      before do
        should_authorize(:new, @category)
      end

      it "assigns a new category as @category" do
        get :new
        assigns(:category).should == @category
      end
    end
  end

  describe "GET edit" do
    before do
      @category = mock(Category).tap do |q|
        q.stub(:id) { 1 }
      end
      Category.should_receive(:find).with('1').and_return(@category)
    end

    context 'not authorized' do
      before do
        should_not_authorize(:edit, @category)
      end

      it "should not be authorized" do
        get :edit, :id => @category.id
        verify_authorization_unsuccessful
      end
    end

    context 'authorized' do
      before do
        should_authorize(:edit, @category)
      end

      it "assigns given category as @category" do
        get :edit, :id => @category.id
        assigns(:category).should == @category
      end
    end
  end

  describe "POST create" do
    let :params do
      {
      :name => "What's up?"
      }
    end

    before do
      Category.should_receive(:new).with(params.with_indifferent_access).and_return(category)
    end

    context 'authorized' do
      before do
        should_authorize(:create, category)
        post :create, :category => params
      end

      context "with valid params" do

        let :category do
          mock_model(Category).tap do |q|
            q.stub(:save) { true }
            q.stub(:id) { 1 }
          end
        end

        it "should notify success on create" do
          flash[:notice].should == 'Category was successfully created.'
        end

        it "redirects to the created category" do
          response.should redirect_to(categories_path)
        end
      end

      describe "with invalid params" do

        let :category do
          mock_model(Category).tap do |q|
            q.stub(:save) { false }
          end
        end

        it "redirects to the created category" do
          response.should render_template(:new)
        end
      end
    end

    context "not authorized" do
      before do
        should_not_authorize(:create, category)
        post :create, :category => params
      end

      let :category do
        mock_model(Category)
      end

      it "should notify success on create" do
        verify_authorization_unsuccessful
      end
    end
  end

  describe "PUT update" do
    let :params do
      {
      :name => "What's up?"
      }
    end

    before do
      Category.should_receive(:find).with('1').and_return(category)
    end

    context 'authorized' do
      before do
        should_authorize(:update, category)
        put :update, :id => category.id, :category => params
      end

      describe "with valid params" do
        let :category do
          mock_model(Category).tap do |q|
            q.stub(:id) { 1 }
            q.stub(:update) { true }
          end
        end

        it "should notify success on create" do
          flash[:notice].should == 'Category was successfully updated.'
        end

        it "redirects to the created category" do
          response.should redirect_to(categories_path)
        end
      end

      describe "with invalid params" do
        let :category do
          mock_model(Category).tap do |q|
            q.stub(:id) { 1 }
            q.stub(:update) { false }
          end
        end

        it "redirects to the created category" do
          response.should render_template(:edit)
        end
      end
    end

    context "not authorized" do
      before do
        should_not_authorize(:update, category)
        put :update, :id => category.id, :category => params
      end

      let :category do
        mock_model(Category).tap do |q|
          q.stub(:id) { 1 }
        end
      end

      it "should notify success on create" do
        verify_authorization_unsuccessful
      end
    end

  end

  describe "DELETE destroy" do
    let :category do
      mock_model(Category).tap do |q|
        q.stub(:id) { 1 }
      end
    end

    before do
      Category.should_receive(:find).with('1').and_return(category)
    end

    context 'authorized' do
      before do
        should_not_authorize(:destroy, category)
        delete :destroy, :id => category.id
      end

      it "should not be authorized" do
        verify_authorization_unsuccessful
      end
    end

    context 'authorized' do
      before do
        should_authorize(:destroy, category)
        category.should_receive(:destroy)
        delete :destroy, :id => category.id
      end

      it "should let you know category was deleted" do
        flash[:notice] == 'Category was successfully destroyed.'
      end

      it "should return to the index" do
        response.should redirect_to categories_path
      end
    end

    context 'authorized' do
      before do
        should_not_authorize(:destroy, category)
        delete :destroy, :id => category.id
      end

      it "should let you know category was deleted" do
        verify_authorization_unsuccessful
      end
    end
  end

end
