require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUM_OF_GUESSES = 10

@@counter = NUM_OF_GUESSES


@@secretnumber = rand(100)


get '/' do
  num = params["guess"].to_i
  message = check_guess(num)
  message = cheating if params["cheat"] == 'true'
  background_color = background_color(num)
  cheat = params["cheat"]
  erb :index, :locals => {:number => @@secretnumber, :message => message, :background_color => background_color}
end

def check_guess(num)
  @@counter -= 1
  if @@counter < 0
     @@secretnumber = rand(100)
    @@counter = NUM_OF_GUESSES
  end
  if num > @@secretnumber + 5
    "Your guess is WAY TO HIGH!\n\nYou have #{@@counter} guesses left"
  elsif num > @@secretnumber
    "guess is to high.\n\nYou have #{@@counter} guesses left"
  elsif num < @@secretnumber - 5
      "Your guess is WAY TO LOW!\n\nYou have #{@@counter} guesses left"
  elsif num < @@secretnumber
      "guess is to low.\n\nYou have #{@@counter} guesses left"
  else
    num == @@secretnumber
    "You got it correctly \n The SECRET NUMBER is #{@@secretnumber}\n you had #{@@counter} guesses left"
  end
end

def cheating
  "Your Cheating!!\n\n
  <br>
  <br>
  The SECRET NUMBER is #{@@secretnumber}"
end


def background_color(num)
  if num > @@secretnumber + 5
    'red'
  elsif num > @@secretnumber
    'blue'
  elsif num < @@secretnumber - 5
      'green'
  elsif num < @@secretnumber
      'yellow'
  else
    num == @@secretnumber
    "purple"
  end
end




# erb :index, :locals => {:number => number}
