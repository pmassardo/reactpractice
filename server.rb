require 'sinatra'
require 'sinatra/reloader'
require 'json'

data = Hash.new

get '/' do
  erb(:index)
end


# get '/api/comments/' do
#
# end

get '/api/comments' do

  comments = JSON.parse(File.read('./comments.json', encoding: 'UTF-8'))

  # always return json
  # res['Content-Type'] = 'application/json'
  # res['Cache-Control'] = 'no-cache'
  # res['Access-Control-Allow-Origin'] = '*'
  # res.body = JSON.generate(comments)

  return comments.to_json

end

post '/api/comments' do

  comments = JSON.parse(File.read('./comments.json', encoding: 'UTF-8'))


    # Assume it's well formed
    comment = { id: (Time.now.to_f * 1000).to_i }

    comment[:author] = params[:author]
    comment[:text] = params[:text]

    # req.query.each do |key, value|
    #   comment[key] = value.force_encoding('UTF-8') unless key == 'id'
    # end
    comments << comment
    File.write(
      './comments.json',
      JSON.pretty_generate(comments, indent: '    '),
      encoding: 'UTF-8'
    )

  # always return json
  # res['Content-Type'] = 'application/json'
  # res['Cache-Control'] = 'no-cache'
  # res['Access-Control-Allow-Origin'] = '*'
  # res.body = JSON.generate(comments)

  return comments.to_json

end

# get '/' do
#   erb(:index)
# end
#
# get '/api/comments' do
#
#   data = {id: 1, author: "Pete fafafa", text: "This is one comment"},
#   data = {id: 2, author: "Jordan lalala", text: "This is *another* comment"}
#
#   return data.to_json
#
# end
#
# post '/api/comments' do
#
#   data = {id: 3, author: "ffffff lalala", text: "This is *another* comment"}
#
#   logger.info data.inspect
#
#
#   return data.to_json
#
#
# end
