module CategoriesHelper

  def category_options(relation)
    sorted_categories = relation.sort{|x,y| x.lft <=> y.lft}

    sorted_categories.collect do |p|
      attributes = {}
      attributes['class'] = "indention_level_#{p.level}"
      [p.name, p.id, attributes]
    end
  end

  def parent_category_selector(form)
    form.select(:parent_id, category_options(Category.all), { :include_blank => "" }, { :class => "category_selector"})
  end

  def category_selector(form)
    form.select(:category_id, category_options(Category.root.descendants), { :include_blank => "" }, { :class => "category_selector"})
  end
end