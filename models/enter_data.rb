require 'sqlite3'

#database.execute( "create table movies (id INTEGER PRIMARY KEY, title TEXT, tags TEXT, ratings TEXT, description TEXT DEFAULT 'None', image TEXT DEFAULT 'https://tse1.mm.bing.net/th?id=OIP.uWhNeQj1hL2T1kVmF2DpSAHaE8&pid=Api', number_of_ratings INTEGER DEFAULT 1);")



def data_entry(title, tags, rating, description='None', image='https://tse1.mm.bing.net/th?id=OIP.uWhNeQj1hL2T1kVmF2DpSAHaE8&pid=Api', num_of_ratings=1)
  database = SQLite3::Database.new( "new.database" )
  rounded_rating = '%.2f' % rating
  existing_movie = database.execute("select title from movies where title='#{title}'")
  
  if existing_movie.length == 0
    database.execute("insert into movies (title, tags, ratings, description, image, number_of_ratings) values ('#{title}', '#{tags.downcase}', '#{rounded_rating}', '#{description}', '#{image}', '#{num_of_ratings}')")
  end
end

def tag_entry(tag_name)
  database = SQLite3::Database.new( "new.database")
  existing_tag = database.execute("select tag from tags where tag='#{tag_name.downcase.gsub(" ", "_")}'")
  if existing_tag.length == 0
    database.execute("insert into tags (tag) values ('#{tag_name.downcase.gsub(" ", "_")}')")
  end
end





  


  