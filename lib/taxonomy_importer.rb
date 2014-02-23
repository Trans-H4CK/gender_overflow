class TaxonomyImporter
  def initialize
    @categories_tree = [
      {:name => "Employment"},
      {:name => "Spirituality and religion"},
      {:name => "Parenting"},
      {:name => "Support for partners, families, friends"},
      {:name => "Veterans"},
      {:name => "Transition-related products (i.e., packers, binders, breast forms)"},
      {:name => "Social support"},
      {:name => "Trans-friendly companies/businesses"},
      {:name => "Bathrooms"},
      {:name => "Gyms/health clubs and locker rooms "},
      {:name => "Pronouns"},
      {:name => "ID documents (name and gender maker change)"},
      {:name => "Inspirations"},
      {:name => "Mentors and possibility models"},
      {:name => "Political"},
      {:name => "Youth"},
      {
        :name => "Health and wellness",
        :children => [
          {:name => "Sexual and reproductive health"},
          {:name => "HIV and AIDS"},
          {:name => "Hormone therapy"},
          {:name => "Surgeries"},
          {:name => "Hair removal"},
          {:name => "Body hair!"}
        ]
      },
      {
        :name => "Transition",
        :children => [
          {:name => "Gender roles"},
          {:name => "How do I start? What are my options?"}
        ]
      },
      {
        :name => "Substance use",
        :children => [
          {:name => "Addiction"},
          {:name => "Recovery"}
        ]
      },
      {
        :name => "Mental health ",
        :children => [
          {:name => "Coping mechanisms"},
          {:name => "Support systems"},
          {:name => "Stress"},
          {:name => "Meditation"},
          {:name => "Depression"}
        ]
      },
      {
        :name => "Trans 101",
        :children => [
          {:name => "Pride festival information (worldwide)"},
          {:name => "Sexuality and trans identities"},
          {:name => "Gender identity"}
        ]
      },
      {
        :name => "Coming out",
        :children => [
          {:name => "Disclosure"},
          {:name => "Dating"},
          {:name => "Sex"},
          {:name => "Transitioning between identity communities (i.e., a person who is dyke-identified who undergoes transition as a masculine-identified trans person and leaves his dyke community)"},
        ]
      },
      {
        :name => "Relationships",
        :children => [
          {:name => "Dating"},
          {:name => "Disclosure"},
          {:name => "Sex"}
        ]
      },
      {:name => "Fashion"},
      {:name => "Activism"},
      {
        :name => "Education",
        :children => [
          {:name => "History (of trans* folks and communities)"},
          {:name => "Trans books and films"}
        ]
      },
      {
        :name => "Know your rights (state and federal)",
        :children => [
          {:name => "Discrimination"},
          {:name => "Identification documents"},
          {:name => "Employment"},
          {:name => "Housing"},
          {:name => "Public accommodations"}
        ]
      },
      {
        :name => "“How To” (help me look good!)",
        :children => [
          {:name => "Hygiene"},
          {:name => "Shaving"},
          {:name => "Tie a tie"},
          {:name => "Picking out binders"},
          {:name => "How to tuck"},
          {:name => "How to pack"},
          {:name => "Tips and tricks"},
          {:name => "Find the right barber"},
          {:name => "Clothes shopping"}
        ]
      }
    ]
  end

  def build_node(node, parent)
    category = Category.new(:name => node[:name])
    category.parent = parent
    category.save
    if node[:children]
      node[:children].each do |child|
        build_node(child, category)
      end
    end
  end

  def build
    @categories_tree.each do |category|
      build_node(category, Category.root)
    end
  end
end
