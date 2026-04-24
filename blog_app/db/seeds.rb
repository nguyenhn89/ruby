# Categories
categories = [
  "Điện thoại",
  "Laptop",
  "Máy tính bảng",
  "Phụ kiện",
  "Đồng hồ thông minh"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end

puts "✓ Tạo #{Category.count} danh mục"

# Products
products = [
  { name: "iPhone 15 Pro", description: "Chip A17 Pro, camera 48MP, titanium", price: 29_990_000, stock: 50, category: "Điện thoại" },
  { name: "Samsung Galaxy S24", description: "Snapdragon 8 Gen 3, màn hình 6.2 inch", price: 22_990_000, stock: 30, category: "Điện thoại" },
  { name: "Xiaomi 14", description: "Leica camera, sạc 90W", price: 18_500_000, stock: 40, category: "Điện thoại" },
  { name: "OPPO Find X7", description: "Hasselblad camera, Dimensity 9300", price: 16_990_000, stock: 25, category: "Điện thoại" },

  { name: "MacBook Pro M3", description: "Chip M3 Pro, 18GB RAM, 512GB SSD", price: 52_990_000, stock: 20, category: "Laptop" },
  { name: "Dell XPS 15", description: "Intel Core i7, 16GB RAM, OLED 4K", price: 38_500_000, stock: 15, category: "Laptop" },
  { name: "Asus ROG Zephyrus G14", description: "Ryzen 9, RTX 4060, 165Hz", price: 35_990_000, stock: 18, category: "Laptop" },
  { name: "Lenovo ThinkPad X1 Carbon", description: "i7 Gen 13, 16GB, siêu mỏng nhẹ", price: 42_000_000, stock: 12, category: "Laptop" },

  { name: "iPad Pro M4 12.9\"", description: "Chip M4, màn hình OLED, Apple Pencil Pro", price: 31_990_000, stock: 22, category: "Máy tính bảng" },
  { name: "Samsung Galaxy Tab S9+", description: "Snapdragon 8 Gen 2, màn hình 12.4 inch", price: 22_990_000, stock: 20, category: "Máy tính bảng" },

  { name: "Apple Watch Series 9", description: "Chip S9, màn hình always-on, GPS", price: 11_990_000, stock: 35, category: "Đồng hồ thông minh" },
  { name: "Samsung Galaxy Watch 6", description: "BioActive Sensor, pin 40h", price: 7_990_000, stock: 28, category: "Đồng hồ thông minh" },

  { name: "AirPods Pro 2", description: "ANC chủ động, chip H2, USB-C", price: 6_490_000, stock: 60, category: "Phụ kiện" },
  { name: "Cáp sạc USB-C 100W", description: "Sạc nhanh, dài 2m, bọc nylon", price: 299_000, stock: 200, category: "Phụ kiện" },
  { name: "Ốp lưng iPhone 15 Pro", description: "Chất liệu MagSafe, chống sốc", price: 490_000, stock: 150, category: "Phụ kiện" },
]

products.each do |p|
  category = Category.find_by(name: p[:category])
  Product.find_or_create_by!(name: p[:name]) do |product|
    product.description = p[:description]
    product.price       = p[:price]
    product.stock       = p[:stock]
    product.category    = category
  end
end

puts "✓ Tạo #{Product.count} sản phẩm"
