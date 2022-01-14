class Mutant < ApplicationRecord
  validates :dna, presence: true
end
