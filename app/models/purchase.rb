class Purchase < ApplicationRecord
  has_one :destination
  belongs_to :user
  belongs_to :item
end
