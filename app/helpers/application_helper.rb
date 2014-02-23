module ApplicationHelper
  def set_headline(headline)
    content_for(:headline, headline)
  end
end
