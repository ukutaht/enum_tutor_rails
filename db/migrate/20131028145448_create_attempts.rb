class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.text :attempt_text
      t.boolean :passed

      t.timestamps
    end
  end
end
