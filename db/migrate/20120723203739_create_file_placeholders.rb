class CreateFilePlaceholders < ActiveRecord::Migration
  def change
    create_table :file_placeholders do |t|
      t.integer :commit_id
      t.integer :file_index
    end
    add_index :file_placeholders, [:commit_id, :file_index]
  end
end
