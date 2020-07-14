class Purchase < ApplicationRecord
  has_many :items , dependent: :delete_all 
  belongs_to :user, optional: true
  
end
