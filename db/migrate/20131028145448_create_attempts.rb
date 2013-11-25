class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.text :attempt_text, null: false
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
