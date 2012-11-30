class Position < ActiveRecord::Base
  belongs_to :person

  attr_accessible :company, :end_date, :location, :start_date, :title, :description
end
