module V1
  class StatsController < ApplicationController
    def index
      render json: build_report, stauts: :ok
    end

    private

    def build_report
      {
        count_mutant_dna: count_species(true),
        count_human_dna: count_species(false),
        ratio: build_ratio
      }
    end

    def count_species(value)
      Mutant.where(is_mutant: value).count
    end

    def build_ratio
      (count_species(true).to_f / count_species(false)).round(2)
    end
  end
end
