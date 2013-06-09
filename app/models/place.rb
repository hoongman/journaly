class Place < ActiveRecord::Base
  attr_accessible :end_date, :latitude, :longitude, :place, :start_date
  has_many :journal_entries
  belongs_to :trip
end

