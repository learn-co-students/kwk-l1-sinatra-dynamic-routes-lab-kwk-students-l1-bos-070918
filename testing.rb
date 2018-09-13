#@tags = params.values

require_relative 'models/sorting.rb'

@tags = ["funny", "happy", "horror"]

#@rows = database.execute( "select * from movies" )

@rows = [[1, "The Notebook", "funny, happy, horror", 4.65], [2, "Titanic", "funny, happy", 3.78], [3, "Love Actually", "funny, happy", 4.99]]
    
ordered_array = [[],[],[],[],[],[]]

    
    @rows.each do |entry|
      entry_tags = entry[2].split(', ')
      tag_matches = 0 
      @tags.each do |tag|
        if entry_tags.include?(tag)
          tag_matches += 1 
        end
      end
      ordered_array[tag_matches] << entry 
    end
    
    while ordered_array.include?([])
      ordered_array.delete([])
    end
    
    for i in (0..(ordered_array.length - 1))
      sorted_subarray = rating_sorted(ordered_array[i])
      ordered_array[i] = sorted_subarray
    end

   @final_array = ordered_array.reverse.flatten(1)
    
  print @final_array