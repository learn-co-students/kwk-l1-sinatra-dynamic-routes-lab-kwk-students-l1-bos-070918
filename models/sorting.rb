#Successful method for sorting subcategories of movies (divided up by tag matches) by ratings

require 'sqlite3'

def rating_sorted(array)
  sort_array = []
  array.each do |movie|
    identifier = "#{movie[3]}#{movie[1]}" #The first value will be the ratings, second will be the name; change indices accordingly
    sort_array << identifier
  end
  
  sort_array.sort!.reverse!
  sort_array.each do |item| #the item is the identifier (rating+movie name)
    index = sort_array.index(item)
    sort_array[index] = array.rassoc(item[4..(item.length - 1)]) #This will find the movie info array by searching for the movie name
  end
  
  return sort_array
  
end

#Method returns an array of movies, sorted by tag matches and ratings 

def full_sort_movies(given_tags)

    database = SQLite3::Database.new("new.database")

    rows = database.execute( "select * from movies" )
    
    ordered_array = [[],[],[],[],[],[]]
    
    rows.each do |entry|
      entry_tags = entry[2].split(', ')
      tag_matches = 0 
      given_tags[0][0].split(", ").each do |tag|
        if entry_tags.include?(tag)
          tag_matches += 1 
        end
      end
      if tag_matches > 0                    #if the movie has any of the same tags, add it to the display list
        ordered_array[tag_matches] << entry 
      end
    end
    
    while ordered_array.include?([])
      ordered_array.delete([])
    end
    
    for i in (0..(ordered_array.length-1))
      sorted_subarray = rating_sorted(ordered_array[i])
      ordered_array[i] = sorted_subarray
    end
    
    final_array = ordered_array.reverse.flatten(1)
    return final_array
    
end

def full_sort_tags(given_tags)

    database = SQLite3::Database.new("new.database")

    rows = database.execute( "select * from movies" )
    
    ordered_array = [[],[],[],[],[],[]]
    
    rows.each do |entry|
      entry_tags = entry[2].split(', ')
      tag_matches = 0 
      given_tags.each do |tag|
        if entry_tags.include?(tag)
          tag_matches += 1 
        end
      end
      if tag_matches > 0                    #if the movie has any of the same tags, add it to the display list
        ordered_array[tag_matches] << entry 
      end
    end
    
    while ordered_array.include?([])
      ordered_array.delete([])
    end
    
    for i in (0..(ordered_array.length-1))
      sorted_subarray = rating_sorted(ordered_array[i])
      ordered_array[i] = sorted_subarray
    end
    
    final_array = ordered_array.reverse.flatten(1)
    return final_array
    
end
  