json.data do
  json.array! @products do |product|
    json.id       product.id
    json.name     product.name
    json.price    product.price.to_f
    json.stock    product.stock
    json.category product.category&.name
  end
end
json.total @products.length
