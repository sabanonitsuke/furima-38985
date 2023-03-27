class Destination < ApplicationRecord
  belongs_to :purchase
  belongs_to :prefecture
end
