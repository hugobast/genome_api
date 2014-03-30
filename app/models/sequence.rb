class Sequence < ActiveRecord::Base
  validates_uniqueness_of :gene, scope: :species_id
  belongs_to :species
end
