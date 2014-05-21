require 'csv'

def build_data
  dataset = []
  CSV.foreach('public/movies.csv', headers: true) do |row|
    dataset << row.to_hash
  end
  dataset
end

def find_id(data, id)
  data.each do |movie|
    if movie["id"] == id
      return movie["title"]
    end
  end
end

def find_movie(data, id)
  data.each do |movie|
    if movie["id"] == id
      return movie
    end
  end
end
