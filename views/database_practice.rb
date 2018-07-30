require 'sqlite3'

database = SQLite3::Database.new( "new.database" )

#database.execute( "create table movies (id INTEGER PRIMARY KEY, title TEXT, tags TEXT, ratings TEXT, description TEXT DEFAULT 'None', image TEXT DEFAULT 'https://tse1.mm.bing.net/th?id=OIP.uWhNeQj1hL2T1kVmF2DpSAHaE8&pid=Api', number_of_ratings INTEGER DEFAULT 1);")

#database.execute( "create table tags (id INTEGER PRIMARY KEY, tag TEXT);")
