require "genome_import_task"

namespace :dna do
  desc "Imports Genbank file to database"
  task :index, [:path] => :environment do |_, args|
    GenomeImportTask.new(args.path).call
  end
end