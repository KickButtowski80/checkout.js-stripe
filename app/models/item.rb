class Item < ApplicationRecord
    belongs_to :user, :optional => true
    # has_many :purchases
    belongs_to :order, :optional => true
    belongs_to :purchase, :optional => true
end
