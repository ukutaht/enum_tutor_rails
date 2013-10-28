class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :socrates_id, null: false
      t.string :name
      t.string :email, null: false
      t.string :gravatar

      t.timestamps
    end
  end
end
