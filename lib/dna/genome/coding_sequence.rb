module DNA
  class CodingSequence
    attr_reader :feature

    def initialize(feature)
      @feature = feature
    end

    def self.wrap(features)
      features.map { |f| new(f) }
    end

    def method_missing(name, *args)
      begin
        find_qualifier_by_name(name.to_s)
      rescue
        super
      end
    end

    def range
      (location.from..location.to)
    end

    private

    def location
      feature.locations.first
    end

    def find_qualifier_by_name(name)
      feature.qualifiers.select do |q|
        q.qualifier == name
      end.first.value
    end
  end
end