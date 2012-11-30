class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :id
      t.integer :age
      t.string :pers_website
      t.string :specialty
      t.string :facebook
      t.string :twitter
      t.string :industry
      t.integer :num_connections
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :profile_url
      t.string :location
      t.string :country

      t.timestamps
    end
  end
end
