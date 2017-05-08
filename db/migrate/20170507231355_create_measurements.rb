class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
    	t.belongs_to :unit, index: true
    	t.belongs_to :building, index: true
    	t.float :quantity, default: 0
    	t.integer :year

      t.timestamps
    end
  end
end
