module QuestionsHelper
  def switch_vote_title(answer, user)
    if answer.vote_type(user) == "UpVote"
      "Switch to Down Vote"
    else
      "Switch to Up Vote"
    end
  end
end
