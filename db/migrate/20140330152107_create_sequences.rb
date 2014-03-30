class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.references :species, index: true
      t.string :gene
      t.string :product
      t.text :translation
      t.text :dna

      t.timestamps
    end
  end
end
