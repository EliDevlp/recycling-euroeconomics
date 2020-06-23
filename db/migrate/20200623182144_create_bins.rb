class CreateBins < ActiveRecord::Migration[5.2]
  def change
    create_table :bins do |t|
      t.string :colour
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
