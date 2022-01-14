class CreateMutants < ActiveRecord::Migration[6.1]
  def change
    create_table :mutants do |t|
      t.string :dna
      t.boolean :is_mutant

      t.timestamps
    end
  end
end
