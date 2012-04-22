class Bookmailist < Sinatra::Base
  
  enable :logging, :dump_errors, :raise_errors
  
  get '/' do
    'hello'
    #haml :home
  end
  
  post '/incoming_email' do
    puts request
    puts params
  end
  
end