class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
