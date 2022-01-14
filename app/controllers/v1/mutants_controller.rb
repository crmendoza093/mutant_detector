module V1
  class MutantsController < ApplicationController
    def create
      @mutant = Mutant.new
      service = Mutants::DetectorService.new(mutant: @mutant, params: permitted_params)

      response = service.execute!

      if response
        render json: @mutant, status: :ok
      else
        render json: { message: { description: I18n.t('errors.mutant.is_human') } }, status: :forbidden
      end
    end

    private

    def permitted_params
      params.require(:dna)
      params.permit(dna: [])
    end

    def unprocessable_entity
      render json: { errors: @mutant.errors }, status: __method__
    end
  end
end
