class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.text :problem_statement, null: false
      t.integer :challenge_order, null: false
      t.string :initial_data, null: false
      t.string :expected_output, null: false

      t.timestamps
    end
  end
end
