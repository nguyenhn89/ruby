class User
  attr_accessor :id, :name, :age

  def initialize(id:, name:, age:)
    @id = id
    @name = name
    @age = age
  end

  def adult?
    @age >= 18
  end

  def to_h
    { id: @id, name: @name, age: @age }
  end

  def self.from_h(hash)
    new(id: hash[:id], name: hash[:name], age: hash[:age])
  end

  def to_s
    "User(id=#{@id}, name=#{@name}, age=#{@age})"
  end
end