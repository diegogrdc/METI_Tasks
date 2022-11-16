require "sinatra"

get '/' do
  @posts = []
  
  File.open("data.txt", "r") do |file|
    file.each_line do |line|
      @posts.append(line)
    end
  end

  erb :index
end

post '/create' do
  point = params[:point].to_i
  comment = params[:comment]
  save_file(point: point,comment: comment)
  redirect '/'
end

def save_file(point:, comment:)
  post = "Point: #{point} Comment: #{comment}"
  File.open("data.txt", "a") do |file|
    file.puts(post)
  end
end