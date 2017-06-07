class CreateFarmers < ActiveRecord::Migration[5.0]
  def change
    create_table :farmers do |t|
      t.references :item, foreign_key: true
      t.references :source, foreign_key: true

      t.timestamps
    end
  end
end
