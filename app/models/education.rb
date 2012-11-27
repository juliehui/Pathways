class Education < ActiveRecord::Base
  belongs_to :person

  attr_accessible :degree, :end_date, :major, :minor, :school, :start_date
end
