require 'sinatra'
require 'sinatra/reloader'



get '/' do
  number = rand(4)
  erb :index, :locals => {:number => number}

end
# erb :index, :locals => {:number => number}
