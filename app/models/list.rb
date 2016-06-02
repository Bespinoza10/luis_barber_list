class List < ActiveRecord::Base
  has_one :barber
  belongs_to :barber
end
