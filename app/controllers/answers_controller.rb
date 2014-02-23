class AnswersController < ApplicationController
  before_filter :load_question
  before_filter :create_answer, :only => :create
  load_and_authorize_resource

  # GET /questions/new
  def new
    @answer.user = current_user
    @answer.question = @question
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @answer.update(answer_params)
      redirect_to @question, notice: 'Answer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /questions/1
  def destroy
    @answer.destroy
    redirect_to @question, notice: 'Answer was successfully destroyed.'
  end

  private

    def load_question
      @question = Question.find(params[:question_id])
    end

    def create_answer
      @answer = Answer.new(answer_params)
      @answer.user = current_user
      @answer.question = @question
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:answer, :question_id, :user_id)
    end
end