# =============================================================
# 1. CÚ PHÁP VÀ KIỂU DỮ LIỆU CƠ BẢN
# =============================================================

# String
name = "Nguyen"
puts "Hello #{name}"   # nội suy
puts name.upcase       # NGUYEN
puts name.length       # độ dài

puts ""

# Integer / Float
a = 10
b = 3
puts a + b
puts a / b.to_f        # ép sang float

puts ""

# Array
arr = [1, 2, 3]
arr << 4
puts arr[0]
puts arr.inspect       # [1, 2, 3, 4]

puts ""

# Hash
user = { name: "Nguyen", age: 25 }
puts user[:name]
puts user[:age]

puts ""

# Symbol
puts :hello.class      # Symbol
puts :hello == :hello  # true

puts ""

# Boolean
puts true.class        # TrueClass
puts false.class       # FalseClass
puts 1 == 1            # true
puts 1 != 2            # true

# =============================================================
# 2. CÂU ĐIỀU KIỆN
# =============================================================

age = 20

# if / elsif / else
if age >= 18
  puts "Adult"
elsif age >= 13
  puts "Teenager"
else
  puts "Child"
end

puts ""

# unless (ngược của if)
unless age < 18
  puts "Đủ tuổi"
end

puts ""

# case (giống switch)
score = 85
case score
when 90..100 then puts "Excellent"
when 70..89  then puts "Good"
when 50..69  then puts "Average"
else              puts "Fail"
end

# =============================================================
# 3. VÒNG LẶP
# =============================================================

puts ""

# each
[1, 2, 3].each do |x|
  puts x
end

puts ""

# times
3.times do |i|
  puts "Lần #{i + 1}"
end

puts ""

# while
i = 0
while i < 3
  puts "while: #{i}"
  i += 1
end

puts ""

# for
for x in [10, 20, 30]
  puts x
end

# =============================================================
# 4. METHOD (HÀM)
# =============================================================

puts ""

def greet(name, greeting = "Hello")
  "#{greeting}, #{name}!"
end

puts greet("Nguyen")
puts greet("Nguyen", "Hi")

def adult?(age)
  age >= 18
end

puts adult?(20)   # true
puts adult?(15)   # false

# =============================================================
# 5. BLOCK, PROC, LAMBDA
# =============================================================

puts ""

# Block
[1, 2, 3].each { |x| puts x * 2 }

puts ""

# Proc — lưu block vào biến
double = Proc.new { |x| x * 2 }
puts double.call(5)   # 10

puts ""

# Lambda — giống Proc nhưng kiểm tra tham số chặt hơn
square = lambda { |x| x * x }
puts square.call(4)   # 16

# Cú pháp ngắn gọn hơn
cube = ->(x) { x ** 3 }
puts cube.call(3)     # 27

# =============================================================
# 6. OOP: CLASS, OBJECT, INHERITANCE, MODULE
# =============================================================

puts ""

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "..."
  end

  def to_s
    "#{self.class.name}(#{@name})"
  end
end

# Kế thừa (inheritance)
class Dog < Animal
  def speak
    "Woof!"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

dog = Dog.new("Rex")
cat = Cat.new("Kitty")
puts dog.speak     # Woof!
puts cat.speak     # Meow!
puts dog.to_s      # Dog(Rex)

puts ""

# Module — dùng để mixin hành vi
module Swimmable
  def swim
    "#{@name} đang bơi"
  end
end

class Duck < Animal
  include Swimmable

  def speak
    "Quack!"
  end
end

duck = Duck.new("Donald")
puts duck.speak    # Quack!
puts duck.swim     # Donald đang bơi

# =============================================================
# 7. EXCEPTION HANDLING
# =============================================================

puts ""

begin
  10 / 0
rescue ZeroDivisionError => e
  puts "Lỗi: #{e.message}"
ensure
  puts "Luôn chạy dù có lỗi hay không"
end

puts ""

begin
  Integer("abc")
rescue ArgumentError => e
  puts "Lỗi chuyển đổi: #{e.message}"
end

# =============================================================
# 8. I/O VÀ XỬ LÝ FILE
# =============================================================

puts ""

# Ghi file
File.write("test.txt", "Hello Ruby\nDòng thứ 2")

# Đọc toàn bộ
content = File.read("test.txt")
puts content

puts ""

# Đọc từng dòng
File.foreach("test.txt") do |line|
  puts ">> #{line.chomp}"
end

# Xóa file sau khi dùng
File.delete("test.txt")

# =============================================================
# 9. ENUMERABLE — xử lý danh sách
# =============================================================

puts ""

numbers = [1, 2, 3, 4, 5, 6]
users = [
  { name: "Nguyen", age: 25 },
  { name: "An",     age: 17 },
  { name: "Minh",   age: 30 }
]

# map — biến đổi từng phần tử, trả về mảng mới
puts numbers.map { |x| x * 2 }.inspect        # [2, 4, 6, 8, 10, 12]
puts users.map { |u| u[:name] }.inspect        # ["Nguyen", "An", "Minh"]

puts ""

# select — lọc phần tử thỏa điều kiện
puts numbers.select { |x| x.old }.inspect   # [2, 4, 6]
puts users.select { |u| u[:age] >= 18 }.inspect

puts ""

# reject — ngược của select
puts numbers.reject { |x| x.even? }.inspect   # [1, 3, 5]

puts ""

# find — tìm phần tử đầu tiên thỏa điều kiện
puts numbers.find { |x| x > 3 }               # 4
puts users.find { |u| u[:name] == "An" }.inspect

puts ""

# reduce — gộp tất cả thành 1 giá trị
puts numbers.reduce(0) { |sum, x| sum + x }   # 21 (tổng)
puts numbers.reduce(1) { |product, x| product * x }  # 720 (tích)

puts ""

# each_with_object — tích lũy vào object (thay thế reduce khi cần Hash)
result = users.each_with_object({}) do |u, hash|
  hash[u[:name]] = u[:age]
end
puts result.inspect   # {"Nguyen"=>25, "An"=>17, "Minh"=>30}

puts ""

# sort_by — sắp xếp theo tiêu chí
puts users.sort_by { |u| u[:age] }.map { |u| u[:name] }.inspect  # ["An", "Nguyen", "Minh"]

puts ""

# any? / all? / none? — kiểm tra điều kiện
puts numbers.any? { |x| x > 5 }   # true
puts numbers.all? { |x| x > 0 }   # true
puts numbers.none? { |x| x > 10 } # true

puts ""

# count — đếm phần tử thỏa điều kiện
puts numbers.count { |x| x.odd? } # 3

puts ""

# flat_map — map rồi flatten 1 cấp
nested = [[1, 2], [3, 4], [5]]
puts nested.flat_map { |arr| arr.map { |x| x * 10 } }.inspect  # [10, 20, 30, 40, 50]

puts ""

# group_by — nhóm theo tiêu chí
grouped = users.group_by { |u| u[:age] >= 18 ? :adult : :minor }
puts grouped[:adult].map { |u| u[:name] }.inspect   # ["Nguyen", "Minh"]
puts grouped[:minor].map { |u| u[:name] }.inspect   # ["An"]