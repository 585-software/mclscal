class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :name
      t.text :url
      t.integer :foreign_id

      t.timestamps
    end
  end
end
