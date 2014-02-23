class QuestionsController < ApplicationController
  before_filter :create_question, :only => :create
  load_and_authorize_resource

  before_filter :check_for_cancel, :only => [:create, :update]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to questions_path
    end
  end
  
  # GET /questions
  def index
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question.user = current_user
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

    def create_question
      @question = Question.new(question_params)
      @question.user = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:question, :category_id, :user_id)
    end
end
