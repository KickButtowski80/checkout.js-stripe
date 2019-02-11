class Order < ApplicationRecord
    # belongs_to :purchase 
    belongs_to :user
    belongs_to :item
end
