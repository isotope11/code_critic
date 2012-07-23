class CreateFileLinePlaceholders < ActiveRecord::Migration
  def change
    create_table :file_line_placeholders do |t|
      t.integer :commit_id
      t.integer :file_index
      t.integer :line_index
    end
    add_index :file_line_placeholders, [:commit_id, :file_index, :line_index], name: 'idx_flp_on_cid_findex_lindex'
  end
end
