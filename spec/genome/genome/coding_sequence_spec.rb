require 'spec_helper'
require "dna/genome/coding_sequence"

describe DNA::CodingSequence do
  let(:feature) do
    double(
      qualifiers: [
        double(qualifier: "gene", value: "dnaA"),
        double(qualifier: "product", value: "Lorem ipsum..."),
        double(qualifier: "translation", value: "MSEKEIWEKV")
      ],
      locations: [double(from: 1, to: 10)]
    )
  end

  it "represents a portion of dna" do
    coding_sequence = DNA::CodingSequence.new(feature)
    expect(coding_sequence.gene).to eq("dnaA")
    expect(coding_sequence.product).to eq("Lorem ipsum...")
    expect(coding_sequence.translation).to eq("MSEKEIWEKV")
    expect(coding_sequence.range).to eq(1..10)
  end

  it "defaults to no method error when qualifier is not present" do
    coding_sequence = DNA::CodingSequence.new(feature)
    expect { coding_sequence.garble_garble }.to raise_exception(NoMethodError)
  end
end