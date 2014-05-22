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

def search_results(data, query)
  results = []
  data.each do |movie|
    count = 0
    wordsmatched = []
    titlewords = movie["title"].downcase.split
    if movie["synopsis"] != nil
      synopsiswords = movie["synopsis"].downcase.split
    end
      query.each do |word|
      if (titlewords.include?(word.downcase) ||
        ((movie["synopsis"].nil? == false) &&
        synopsiswords.include?(word.downcase)))
        wordsmatched << word
        count += 1
      end
    end
    if count > 0
      results << { movie["id"] => movie["title"], (count.to_f/(query.size).to_f * 100).round => wordsmatched }
    end
  end
  results
end
