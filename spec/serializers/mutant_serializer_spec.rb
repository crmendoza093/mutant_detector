require 'rails_helper'

RSpec.describe MutantSerializer, type: :serializer do
  let(:model) { mutants(:base) }
  subject { described_class.new(model).as_json }

  it 'builds the attributes' do
    expect(subject[:dna]).to eq(model.dna)
  end
end
