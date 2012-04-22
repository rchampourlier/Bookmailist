# MongoDB configuration
Mongoid.configure do |config|

	config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db('test')

  # conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  # uri = URI.parse(ENV['MONGOHQ_URL'])
  # config.master = conn.db(uri.path.gsub(/^\//, ''))

end