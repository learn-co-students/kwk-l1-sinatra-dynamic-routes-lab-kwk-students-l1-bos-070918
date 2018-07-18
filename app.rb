require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
get '/reversename/:name' do 
  @name = params[:name]
  @reverse_string = @name.reverse 
  "Your name reversed is #{@reverse_string}."
end 
get '/square/:number' do 
  @number = params[:number].to_i 
  @square_number = @number * @number 
  "The square of your number is #{@square_number}."
end 
get '/say/:number/:phrase' do 
  @number = params[:number].to_i 
  @phrase = params[:phrase]
  @everything = []
  x = 0 
  until x == @number  
  @everything << @phrase 
  x+=1 
  end 
  "#{@everything}"
end 
get '/say/:word1/:word2/:word3/:word4/:word5' do 
  "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
end 
get '/:operation/:number1/:number2' do 
  @number1 = params[:number1].to_i
  @number2 = params[:number2].to_i
  @operation = params[:operation]
  if @operation == "add"
    @answer = @number1 + @number2
  elsif @operation == "subtract"
    @answer = @number1 - @number2
  elsif @operation == "multiply"
    @answer = @number1 * @number2
  elsif @operation == "divide"
    @answer = @number1 / @number2
  end
  "#{@answer}"
end 
end
