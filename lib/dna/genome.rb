require 'bio'
require 'dna/genome/coding_sequence'
require 'dna/genome/coding_sequence_set'

module DNA
  class Genome
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def coding_sequences
      CodingSequenceSet.new(entry)
    end

    def sequence_range(range)
      entry.naseq[range]
    end

    def each_coding_sequences
      coding_sequences.each do |cds|
        yield cds
      end
    end

    def species
      entry.source.fetch("common_name")
    end

    private

    def entry
      @entry ||= Bio::FlatFile.auto(path).first
    end
  end
end