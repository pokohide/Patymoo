class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :admin, index: true
      t.string :name, limit: 64, null: false
      t.text :description
      t.string :link
      t.datetime :start_at

      t.timestamps
    end
  end
end
