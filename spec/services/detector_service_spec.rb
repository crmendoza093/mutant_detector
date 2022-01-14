require 'rails_helper'

RSpec.describe Mutants::DetectorService, type: :service do
  let(:mutant) { Mutant.new }
  let(:payload) { JSON.parse(File.read('spec/fixtures/payloads/mutant.json.erb'), symbolize_names: true) }
  let(:subject) { described_class.new(mutant: mutant, params: payload) }

  describe '#execute!' do
    context 'when the DNA is from a mutant' do
      it 'returns true' do
        expect(subject.execute!).to be true
      end

      it 'creates and persists a new dna in the database' do
        expect { subject.execute! }.to change(Mutant, :count).by(1)
      end
    end

    context 'when the DNA is from a human' do
      before { payload[:dna].pop }

      it 'returns false' do
        expect(subject.execute!).to be false
      end

      it 'creates and persists a new dna in the database' do
        expect { subject.execute! }.to change(Mutant, :count).by(1)
      end
    end
  end
end
