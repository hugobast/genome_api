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

def create_organisms!
  species = Species.create! name: "E. coli"

  Sequence.create!(
    species: species, gene: "gyrA",
    translation: "MSKSYLKNF", dna: "atgtcaaagtcgtatttaaa"
  )

  species = Species.create! name: "S. Aureus"

  Sequence.create!(
    species: species, gene: "gyrA",
    translation: "MSKSYLKNF", dna: "atgtcaaagtcgtaaaattt"
  )

  species = Species.create! name: "C. Diff"

  Sequence.create!(
    species: species, gene: "gyrA",
    translation: "MSKSYLKNF", dna: "atgtcaaagtcgtacccaaa"
  )
end