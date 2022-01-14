module Mutants
  class DetectorService
    def initialize(mutant:, params:)
      @mutant = mutant
      @dna = params[:dna]
    end

    def execute!
      build_mutant_params
      mutant.save!

      mutant.is_mutant
    end

    private

    attr_accessor :mutant, :dna

    def build_mutant_params
      mutant.dna = dna
      mutant.is_mutant = mutant? ? true : false
    end

    def mutant?
      element_count_repetead = 1

      dna.each do |row|
        first_char = row[0]

        (1..row.size - 1).each do |index|
          element = row[index]

          return true if element_count_repetead == 4

          first_char == element ? element_count_repetead += 1 : element_count_repetead = 1
          first_char = element
        end
      end

      false
    end
  end
end
