class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skills
      t.integer :person_id

      t.timestamps
    end
  end
end
