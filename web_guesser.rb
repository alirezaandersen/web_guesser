require 'sinatra'
require 'sinatra/reloader'
require 'pry'


SECRETNUMBER = rand(100)


get '/' do
  num = params["guess"].to_i
  message = check_guess(num)
  background_color = background_color(num)
  cheat = params["cheat"]
  erb :index, :locals => {:number => SECRETNUMBER, :message => message, :background_color => background_color}
end

def check_guess(num)
  if num > SECRETNUMBER + 5
    'Your guess is WAY TO HIGH!'
  elsif num > SECRETNUMBER
    'guess is to high'
  elsif num < SECRETNUMBER - 5
      'Your guess is WAY TO LOW!'
  elsif num < SECRETNUMBER
      'guess is to low'
  else
    num == SECRETNUMBER
    "You got it correctly \n The SECRET NUMBER is #{SECRETNUMBER}"
  end
end



def background_color(num)
  if num > SECRETNUMBER + 5
    'red'
  elsif num > SECRETNUMBER
    'blue'
  elsif num < SECRETNUMBER - 5
      'green'
  elsif num < SECRETNUMBER
      'yello'
  else
    num == SECRETNUMBER
    "purple"
  end
end




# erb :index, :locals => {:number => number}
