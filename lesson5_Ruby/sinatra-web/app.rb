require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  erb :index
end

# localhostでの起動
# ruby app.rb -e development
# http://localhost:4567
