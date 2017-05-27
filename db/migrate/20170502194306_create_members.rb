class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :admin, index: true
      t.string :name, limit: 64, null: false
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :connpass
      t.integer :grade
      t.integer :school_type
      t.string :school_name
      t.string :department
      t.string :phone_number
      t.string :note

      t.timestamps
    end
  end
end
