def create_organism!
  species = Species.create! name: "E. coli"

  Sequence.create!(
    species: species, gene: "gidA",
    translation: "MSKSYLKNF", dna: "atgtcaaagtcgtatttaaa"
  )

  Sequence.create!(
    species: species, gene: "dnaA",
    translation: "SWKNIVENM", dna: "actgaagctgcagcagcctc"
  )

  Sequence.create!(
    species: species, gene: "gyrA",
    translation: "SVENFITE", dna: "ataactgatataggtgtatt"
  )

  species
end

end