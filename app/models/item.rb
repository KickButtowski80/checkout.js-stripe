class Item < ApplicationRecord
    belongs_to :user, :optional => true
    # has_many :purchases
    belongs_to :order
    belongs_to :purchase
end
