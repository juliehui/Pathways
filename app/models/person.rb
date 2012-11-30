class Person < ActiveRecord::Base
  has_many :interests
  has_many :skills
  has_many :educations
  has_many :positions

  attr_accessible :age, :facebook, :gender, :id, :industry, :name, :num_connections, :pers_website, :specialty, :twitter, :profile_url, :first_name, :last_name, :location, :country
end
