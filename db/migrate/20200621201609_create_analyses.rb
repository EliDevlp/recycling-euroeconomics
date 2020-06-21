class CreateAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :analyses do |t|
      t.integer :num1
      t.integer :num2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
