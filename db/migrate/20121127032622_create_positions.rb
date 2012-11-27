class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :start_date
      t.string :end_date
      t.string :title
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end
