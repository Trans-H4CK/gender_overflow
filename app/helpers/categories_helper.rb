module CategoriesHelper

  def category_options
    sorted_categories = Category.all.sort{|x,y| x.lft <=> y.lft}

    sorted_categories.collect do |p|
      attributes = {}
      attributes['class'] = "indention_level_#{p.level}"
      if p.level > 1
        attributes['data-iconurl'] = '/assets/icons/indent_arrow.png'
      end
      [p.name, p.id, attributes]
    end
  end

  def parent_category_selector(form)
    form.select(:parent_id, category_options, { :include_blank => "" }, { :class => "category_selector"})
  end

end