
require_relative 'config/environment'
require_relative 'models/enter_data.rb'
require_relative 'models/sorting.rb'
require 'sqlite3'




class App < Sinatra::Base
  database = SQLite3::Database.new( "new.database" )
  
  get '/' do
    @tags = database.execute("select * from tags")
    erb :index
  end
  
  # post '/da-results' do
  #   @whut = params[:wut]
  #   erb :no_movie_yet
  # end
  
  get '/submission' do
    @tags = database.execute("select * from tags")
    erb :submission
  end
  
  get '/tag_submission' do
    array_tags = database.execute("select * from tags")
    wuttags = []
    for i in 0..(array_tags.length - 1)
      wuttags << array_tags[i][1].capitalize
    end
    if wuttags.length > 1
      @tags = wuttags.join(", ")
    else
      @tags = wuttags[0]
    end
    erb :tag_submission
  end
  
  post '/completed-submission' do
    @movie_title = params["title"]
    @movie_rating = params["rating"]
    array_movie_tags = params[:wut]
    @movie_description = params["description"]
    @movie_image = params["image"]
    middle_movie_tags = []
    for i in 0..(array_movie_tags.length - 1)
      if array_movie_tags[i].length > 0
        middle_movie_tags << array_movie_tags[i]
      end
    end
    if middle_movie_tags.length > 1
      @movie_tags = middle_movie_tags.join(", ")
    else
      @movie_tags = middle_movie_tags[0]
    end
    
    data_entry(@movie_title, @movie_tags, @movie_rating, @movie_description, @movie_image)
    
    erb :thank_you
  end
  
  post '/results-movies' do
    @movie_searched = params["content"]
    
    @tags_from_movie = database.execute("select tags from movies where title = '#{@movie_searched}'")
    
    if @tags_from_movie.length != 0  
      tags = @tags_from_movie
      @sorted_list = full_sort_movies(tags)
      erb :results
    else
      erb :no_movie_yet
    end
  end
  
  post '/results-tags'do

    @tags_requested = params[:del]
    
    @sorted_list = full_sort_tags(@tags_requested)
    
    # @sorted_list = [[1, "The Notebook", ["21st century classic", "cutie alert", "romance", "tearjerker"], "4.56", "A super cute movie!", "https://tse4.mm.bing.net/th?id=OIP.FF6lBbT09dp5VY5es6zbygHaK9&pid=Api"], [2, "Titanic", ["a cool movie", "ocean", "romance"], "5.00", "Another super cute movie!", "https://tse1.mm.bing.net/th?id=OIP.KShZDYyU79giovw5MNdXegHaLH&pid=Api"]]
    
    erb :results
    
  end
  
  get "/no_movie_yet" do
    erb :no_movie_yet
  end
  
  post '/thank_you' do
    tag_entry(params["tag_entered"])
    erb :thank_you
  end
  
  # get '/movie_edits' do
  #   @tags = database.execute("select * from tags")
  #   erb :movie_edits
  # end
  
end


