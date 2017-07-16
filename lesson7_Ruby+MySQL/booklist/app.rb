require 'sinatra'
require 'mysql2'

get '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist', encoding: 'utf8')
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
  erb :booklist
end

post '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist', encoding: 'utf8')

  # フォームからbook_titleを受け取る
  book_title = params['book_title']

  # SQL文をセット
  statement = client.prepare('INSERT INTO books (book_title) VALUES(?)')
  statement.execute(book_title)

  # index表示
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
  erb :booklist
end

# localhostでの起動
# app.rbをいじった時も再起動

# ruby app.rb -e development
# http://localhost:4567
