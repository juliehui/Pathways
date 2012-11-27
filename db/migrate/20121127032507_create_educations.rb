class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :start_date
      t.string :end_date
      t.string :school
      t.string :degree
      t.string :major
      t.string :minor

      t.timestamps
    end
  end
end
