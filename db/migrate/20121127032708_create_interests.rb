class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interest
      t.integer :person_id

      t.timestamps
    end
  end
end
