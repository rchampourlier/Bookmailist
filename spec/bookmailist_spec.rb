require_relative './spec_helper'

describe "bookmailist"  do
	
	describe "POST incoming email" do

		it "should accept incoming email" do
			post '/incoming_email', {
	      :first_name => "Tony",
	      :last_name => "Amoyal",
	      :email => "tamoyal@frontierstrategygroup.com",
	      :password => "aSecurePassword",
	      :password_confirmation => "aSecurePassword"
	    }.to_json
	    response.should be_success
	  end
  end

end