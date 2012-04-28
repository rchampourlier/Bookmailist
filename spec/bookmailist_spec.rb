describe "bookmailist"  do
	
	describe "GET /" do

		before(:each) do
			get '/'
		end

	end

	describe "POST incoming email" do

		before(:each) do
			payload = (File.read(File.join(File.dirname(__FILE__), 'fixtures/incoming_email.json')))
			post '/incoming_email', payload, {"CONTENT_TYPE" => "application/json"}
		end

		it "should accept a POST request with incoming email as JSON payload" do
			last_response.should be_ok
	  end

	  it "should discover links in the email and create bookmarks for each found link"

  end
end