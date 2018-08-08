class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :foreign_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :url
      t.belongs_to :campus, foreign_key: true

      t.timestamps
    end
    add_index :events, :foreign_id
    add_index :events, :start_at
    add_index :events, :end_at
  end
end
