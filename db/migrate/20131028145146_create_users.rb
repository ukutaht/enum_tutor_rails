class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :socrates_id
      t.string :name
      t.string :email
      t.string :gravatar

      t.timestamps
    end
  end
end
