class Answer < ActiveRecord::Base
  include Votable

  belongs_to :question
  belongs_to :user

  def youtube_url=(url)
    self.youtube_id = url.split("/").last
  end

  def youtube_url
    if youtube_id.present?
      "http://youtu.be/" + youtube_id
    else
      ""
    end
  end

end
