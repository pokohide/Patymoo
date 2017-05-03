class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :admin, index: true

      t.string :name, limit: 64, null: false
      t.integer :grade
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :connpass
      t.integer :school_type
      t.string :school_name
      t.string :department
      t.text :note

      t.timestamps
    end
  end
end
