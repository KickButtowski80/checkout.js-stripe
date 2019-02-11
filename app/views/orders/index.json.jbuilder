json.orders @orders do |order|
  json.name order.purchase.item.name
  json.price number_to_currency order.purchase.item.price
end