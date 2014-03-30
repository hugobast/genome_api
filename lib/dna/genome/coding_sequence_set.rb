require 'forwardable'

module DNA
  class CodingSequenceSet
    extend Forwardable
    attr_reader :entry, :cds
    def_delegators :@cds, :count, :first, :each

    def initialize(entry)
      @entry = entry
      map_coding_sequences!
    end

    private

    def map_coding_sequences!
      @cds ||= CodingSequence.wrap(entry.features.select do |f|
        f.feature == "CDS"
      end)
    end
  end
end