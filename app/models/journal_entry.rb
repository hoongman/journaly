class JournalEntry < ActiveRecord::Base
  belongs_to :place
  attr_accessible :post, :title
end
