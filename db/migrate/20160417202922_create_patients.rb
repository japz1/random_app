class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :identification, null: false
      t.string :modality, null: false
      t.string :catheter, null: false
      t.string :caliber, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :patients, [:user_id, :created_at]
  end
end
