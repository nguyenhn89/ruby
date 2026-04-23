require "json"

class JsonStore
  def initialize(file_path)
    @file_path = file_path
    @counter_path = file_path.sub(".json", "_counter.json")
    ensure_file
  end

  def read_all
    data = File.read(@file_path)
    JSON.parse(data, symbolize_names: true)
  rescue JSON::ParserError
    []
  end

  def write_all(array)
    File.write(@file_path, JSON.pretty_generate(array))
  end

  def next_id
    counter = read_counter + 1
    File.write(@counter_path, counter.to_s)
    counter
  end

  private

  def read_counter
    File.exist?(@counter_path) ? File.read(@counter_path).to_i : 0
  end

  def ensure_file
    File.write(@file_path, "[]") unless File.exist?(@file_path)
  end
end