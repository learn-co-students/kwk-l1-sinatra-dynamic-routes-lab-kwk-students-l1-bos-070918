require_relative 'config/environment'

class App < Sinatra::Base
 
 get '/' do
   "Welcome to your Home Page"
 end
 
 get '/reversename/:name' do
   @name = params[:name].reverse
   "Your reversed name is #{@name}. "
 end
 
 get '/square/:number' do
   @factor = params[:number].to_i
   @answer = @factor*@factor
   "The square is #{@answer}."
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
   @word_1 = params[:word1]
   @word_2 = params[:word2]
   @word_3 = params[:word3]
   @word_4 = params[:word4]
   @word_5 = params[:word5]
   "#{@word_1} #{@word_2} #{@word_3} #{@word_4} #{@word_5}."
 end
 
 get '/:operation/:number1/:number2' do
   operators = {"add"=>"+", "subtract"=>"-", "divide"=>"/", "multiply"=>"*"}
   practice = eval("#{params[:number1]} #{operators[params[:operation]]} #{params[:number2]}")
   return practice.to_s
 end
end