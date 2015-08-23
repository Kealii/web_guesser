require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  cheat = params[:cheat]
  message = check_guess(guess)
  cheat_message = cheat_mode(cheat)
  erb :index, :locals => {:number        => SECRET_NUMBER,
                          :message       => message,
                          :cheat_message => cheat_message}
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
    message = "The secret number is #{number}. You got it right! "
  end
end

def cheat_mode(cheat)
  if cheat == 'true'
    "The secret number is #{SECRET_NUMBER}."
  end
end
