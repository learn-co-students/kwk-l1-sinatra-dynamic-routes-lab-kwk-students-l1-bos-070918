require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
gets '/say/:number/:phrase'
end
require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  
  get '/reversename/:name' do
    @username = params[:name]
    "Your reversed string is: #{@username.reverse}"
  end
  
  get '/square/:number' do
    @num = params[:number].to_i
    @num = @num**2
    "#{@num}"
  end
  
  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrases = params[:phrase]
    @all_phrases = ""
    for i in 1..@num
     @all_phrases+="#{@phrases}\n"
    end
    
    return @all_phrases
    end
    
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end
  
  get '/:operation/:number1/:number2' do
    operators = {"add"=>"+", "subtract"=>"-", "divide"=>"/", "multiply"=>"*"}
    practice = eval("#{params[:number1]} #{operators[params[:operation]]} #{params[:number2]}")
    return practice.to_s
  end

end


Add CommentCollapse 