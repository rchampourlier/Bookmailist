# MongoDB configuration
Mongoid.configure do |config|

	##
	# Test configuration
	#
	if %w(development test).include?(ENV["RACK_ENV"])
		config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db("bookmailist_#{ENV['RACK_ENV']}")
	
	else

		##
		# Production configuration
		#

		# For a local MongoDB
		# config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db("bookmailist_#{ENV['RACK_ENV']}")

		# For a MongoLab account
		#
		# You can replace ENV["MONGODB_PASSWORD"] by your password directly, or set the MONGODB_PASSWORD environment
		# on your production environment instead. The second solution is better if you're committing this file to 
		# a repo!
		user = "bookmailist"
		password = ENV["MONGODB_PASSWORD"]
		database = ENV["MONGODB_DATABASE"]
		db_url = "mongodb://#{user}:#{password}@ds033107.mongolab.com:33107/#{database}"
		config.master = Mongo::Connection.from_uri(db_url).db("bookmailist_#{ENV['RACK_ENV']}")

		# For a MongoHQ account
		#
	  # conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
	  # uri = URI.parse(ENV['MONGOHQ_URL'])
	  # config.master = conn.db(uri.path.gsub(/^\//, ''))

	end
end