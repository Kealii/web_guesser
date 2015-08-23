require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  number = SECRET_NUMBER
  range = 5
  if guess == 0
    message = ""
  elsif guess > (number + range)
    message = "Way Too High!"
  elsif guess > number
    message = "Too High"
  elsif guess < (number - range)
    message = "Way Too Low!"
  elsif guess < number
    message = "Too Low"
  else
    message = "The secrect number is #{number}. You got it right! "
  end
end
