json.id          @product.id
json.name        @product.name
json.price       @product.price.to_f
json.stock       @product.stock
json.description @product.description
json.category    @product.category&.name
