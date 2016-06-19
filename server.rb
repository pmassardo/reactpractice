require 'sinatra'
require 'sinatra/reloader'



get '/api/comments' do
  erb(:index)
end
