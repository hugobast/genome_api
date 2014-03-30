class Sequence < ActiveRecord::Base
  validates_uniqueness_of :gene
  belongs_to :species
end
