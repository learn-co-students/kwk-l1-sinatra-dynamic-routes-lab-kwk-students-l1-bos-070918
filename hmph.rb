 
 
class MovieTV
  attr_accessor :title, :tags, :ratings, :description
  
  def initialize(title, tags, ratings, description="None")
    @title = title
    @tags = tags
    @ratings = ratings
    @description = description
  end
  
end

entry = ["The Notebook", ["romance", "tearjerker"], 4.6]

MovieTV.new(entry[0], entry[1], entry[2])
