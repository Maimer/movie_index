require 'csv'

def build_data
  dataset = []
  CSV.foreach('public/movies.csv', headers: true) do |row|
    dataset << row.to_hash
  end
  dataset
end
