class Interest < ActiveRecord::Base
  belongs_to :person

  attr_accessible :interest
end
