class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.integer :challenge_id
      t.string :method
      t.xml :html, null: false

      t.timestamps
    end
  end
end
