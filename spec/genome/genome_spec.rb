require 'spec_helper'
require 'dna/genome'

describe DNA::Genome do
  let(:genome) { DNA::Genome.new("spec/fixtures/example_genebank") }

  it "takes a path to gbk file and returns a list of genes" do
    expect(genome.coding_sequences.count).to equal(3)
  end

  it "gets the dna representing a coding_sequence" do
    coding_sequence = genome.coding_sequences.first
    strand = genome.sequence_range(coding_sequence.range)

    expect(strand.length).to equal(206)
  end

  it "references the specie" do
    expect(genome.species).to eq(
      "Saccharomyces cerevisiae (baker's yeast)"
    )
  end

  it "iterates over all the sequences" do
    genome.each_coding_sequences do |coding_sequence|
      strand = genome.sequence_range(coding_sequence.range)
      expect(strand.length).to equal(206)
      break
    end
  end
end