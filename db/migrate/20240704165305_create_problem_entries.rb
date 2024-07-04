class CreateProblemEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :problem_entries do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.string :website_url

      t.timestamps
    end
    add_index :problem_entries, :creator_id
    add_index :problem_entries, :title
    add_index :problem_entries, :website_url
  end
end
