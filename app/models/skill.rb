class Skill < ActiveRecord::Base
  belongs_to :person

  attr_accessible :skills
end
