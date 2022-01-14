require 'rails_helper'

RSpec.describe Mutant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:dna) }
  end
end
