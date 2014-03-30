require "dna/genome"
require "open-uri"

namespace :dna do
  desc "Imports Genbank file to database"
  task :index, [:path] => :environment do |_, args|
    file = open(args.path)

    dna = DNA::Genome.new(file)
    name = dna.species

    begin
      genome = Species.create!(name: name)
    rescue ActiveRecord::RecordInvalid
      genome = Species.find_by(name: name)
    end

    dna.each_coding_sequences do |coding_sequence|
      begin
        Sequence.create!(
          species: genome,
          gene: coding_sequence.protein_id,
          product: coding_sequence.product,
          translation: coding_sequence.translation,
          dna: dna.sequence_range(coding_sequence.range)
        )
      rescue Exception => e
        puts e.message
      end
    end

    file.close
  end
end