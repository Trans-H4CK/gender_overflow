module QuestionsHelper
  def switch_vote_title(answer, user)
    if answer.vote_type(user) == "UpVote"
      "Switch to Down Vote"
    else
      "Switch to Up Vote"
    end
  end

  def youtube_embed(answer, width='560', height='315')
    if answer.youtube_id.present?
      to_ret = ''
      to_ret << "<iframe width='#{width}' height='#{height}'  src='//www.youtube.com/embed/#{answer.youtube_id}' frameborder='0' allowfullscreen>"
      to_ret << '</iframe>'
      to_ret = to_ret.html_safe
    end
  end
end
