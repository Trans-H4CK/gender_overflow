module ApplicationHelper
  def set_headline(headline)
    content_for(:headline, headline)
  end

  def body_class
    klasses = params[:controller].split("/")
    klasses << params[:action]
    klasses << @body_classes if @body_classes
    klasses
  end

  def add_body_class(klass)
    if @body_classes
      @body_classes << klass
    else
      @body_classes = [klass]
    end
  end

end
