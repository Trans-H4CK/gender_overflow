class QuestionsController < ApplicationController
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

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:question, :category_id, :user_id)
    end
end
