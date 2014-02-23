namespace :db do
  namespace :taxonomy do
    task :load => :environment do
      require 'taxonomy_importer'
      importer = TaxonomyImporter.new
      importer.build
    end
  end
end
