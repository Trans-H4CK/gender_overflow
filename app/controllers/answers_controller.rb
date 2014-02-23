class AnswersController < ApplicationController
  before_filter :load_question
  before_filter :create_answer, :only => :create
  load_and_authorize_resource :except => [:up_vote, :down_vote, :switch_vote, :delete_vote]
  before_filter :load_answer_and_authorize_vote, :only => [:up_vote, :down_vote, :switch_vote, :delete_vote]
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

  def up_vote
    if @answer.up_vote(current_user)
      redirect_to @question, notice: 'Answer was up voted!'
    else
      flash[:error] = @answer.errors.full_messages.join(", ")
      redirect_to @question
    end
  end

  def down_vote
    if @answer.down_vote(current_user)
      redirect_to @question, notice: 'Answer was down voted!'
    else
      flash[:error] = @answer.errors.full_messages.join(", ")
      redirect_to @question
    end
  end

  def switch_vote
    @answer.switch_vote(current_user)
    redirect_to @question, notice: 'Your vote was switched!'
  end

  def delete_vote
    @answer.delete_vote(current_user)
    redirect_to @question, notice: 'Vote removed!'
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
      params.require(:answer).permit(:answer, :question_id, :user_id, :youtube_url)
    end

    def load_answer_and_authorize_vote
      @answer = Answer.find(params[:id])
      authorize! :vote, @answer
    end

end