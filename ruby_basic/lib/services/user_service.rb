require_relative "../models/user"
require_relative "../storage/json_store"

class UserService
  def initialize
    @store = JsonStore.new("users.json")
  end

  def all
    @store.read_all.map { |u| User.from_h(u) }
  end

  def create(name, age)
    users = all
    new_id = @store.next_id

    user = User.new(id: new_id, name: name, age: age)
    users << user

    persist(users)
    user
  end

  def find(id)
    all.find { |u| u.id == id }
  end

  def update(id, name: nil, age: nil)
    users = all
    user = users.find { |u| u.id == id }
    return nil unless user

    user.name = name if name
    user.age = age if age

    persist(users)
    user
  end

  def delete(id)
    users = all
    new_users = users.reject { |u| u.id == id }

    return false if users.size == new_users.size

    persist(new_users)
    true
  end

  private

  def persist(users)
    @store.write_all(users.map(&:to_h))
  end
end