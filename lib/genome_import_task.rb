require "open-uri"
require "dna/genome"

class GenomeImportTask
  attr_reader :dna

  def initialize(path)
    @path = path
  end

  def call
    open(@path) do |file|
      @dna = DNA::Genome.new(file)

      species = species_with_name(dna.species)
      create_sequences(species)
    end
  end

  private

  def create_sequences(species)
    dna.each_coding_sequences do |coding_sequence|
      create_sequence(coding_sequence, dna, species)
    end
  end

  def create_sequence(coding_sequence, dna, species)
    begin
      sequence = sequence_with_protein(coding_sequence.gene)

      sequence.update_attributes(
        species: species,
        translation: coding_sequence.translation,
        dna: dna.sequence_range(coding_sequence.range)
      )
    rescue NoMethodError
      # Nothing can be done, missing gene means we won't use it.
    end
  end

  def sequence_with_protein(protein_id)
    Sequence.find_or_create_by_gene(protein_id)
  end

  def species_with_name(name)
    Species.find_or_create_by_name(name)
  end
end