require 'spec_helper'
require "dna/genome/coding_sequence_set"

describe DNA::CodingSequenceSet do
  let(:entry) do
    features = 100.times.map { double(feature: 'CDS') }
    double(features: features)
  end

  it "takes a genbank entry and gets the list of coding sequences" do
    cds = DNA::CodingSequenceSet.new(entry)
    expect(cds.count).to equal(100)
  end
end