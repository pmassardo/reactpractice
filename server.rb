require 'sinatra'
require 'sinatra/reloader'
require 'json'



get '/' do
  erb(:index)
end

get '/api/comments' do
  data = {id: 1, author: "Pete dadada", text: "This is one comment"},
  {id: 2, author: "Jordan lalala", text: "This is *another* comment"}

  return data.to_json

end
