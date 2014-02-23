class CategoriesController < ApplicationController
  before_filter :create_category, :only => :create
  before_filter :load_categories, :only => :index
  load_and_authorize_resource

  # GET /questions
  def index
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /questions/1
  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

    def load_categories
      @categories = Category.root.descendants
    end

    def create_category
      @category = Category.new(category_params)
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :parent_id)
    end

end