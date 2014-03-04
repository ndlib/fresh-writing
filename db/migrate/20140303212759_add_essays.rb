class AddEssays < ActiveRecord::Migration
  def change

    create_table "essays" do | t |
      t.integer :issue_id
      t.text :data
      t.timestamps
    end

    add_index :issue_id
  end
end
