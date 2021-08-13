class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.references :folder

      t.timestamps
    end
    add_index :notes, :folder_id
  end
end
