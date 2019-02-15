class Purchase < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :user
  
end
