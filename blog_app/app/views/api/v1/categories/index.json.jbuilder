json.data do
  json.array! @categories do |category|
    json.id   category.id
    json.name category.name
  end
end
json.total @categories.length
