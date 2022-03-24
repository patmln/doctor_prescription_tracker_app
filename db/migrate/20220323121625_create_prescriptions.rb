class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :title
      t.date :date
      t.string :medicine
      t.string :price
      t.string :quantity
      t.string :notes
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
