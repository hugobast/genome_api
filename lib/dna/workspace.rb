require 'bio'

sequence = Bio::FlatFile.auto("specs/fixtures/dataset.gbk")

sequence.each do |entry|
  entry.features.each do |feature|
    if feature.feature == "CDS"
      start = feature.locations.first.from
      stop = feature.locations.first.to

      dna = entry.naseq[start..stop]

      gene = feature.qualifiers.select do |q|
        q.qualifier == "gene"
      end.first

      product = feature.qualifiers.select do |q|
        q.qualifier == "product"
      end.first

      puts "#{(gene.value if gene) || "hyp."}: #{dna[0..20]}...#{dna[-10..-1]} #{product.value if product}"
    end
  end
end