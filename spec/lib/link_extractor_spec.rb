describe LinkExtractor do

	describe LinkExtractor::HTML do

		describe "from" do

			before(:all) do
				@html_first_link_title = "the first link title"
				@html_first_link = "http://www.first.com"
				@html_second_link_title = "the second link title"
				@html_second_link = "http://www.second.com"

				@html_1_link 	= "<html><head></head><body><a href='#{@html_first_link}'>#{@html_first_link_title}</a></body></html>"
				@html_2_links = "<html><head></head><body><a href='#{@html_first_link}'>#{@html_first_link_title}but with a second one too <a href='#{@html_second_link}'>#{@html_second_link_title}</body></html>"
			end

			it "should return an empty array" do
				LinkExtractor::HTML.from("").should == []
			end

			it "should contain an array with 1 object" do
				LinkExtractor::HTML.from(@html_1_link).count.should == 1
			end

			it "should contain 2 entries" do
				LinkExtractor::Text.from(@html_2_links).count.should == 2
			end

		end

	end

	describe LinkExtractor::Text do

		before(:all) do
			@text_1_link 	= "content with a link as plain text http://www.alink_in_plain_text.com"
			@text_2_links = "content with a link as plain text http://www.alink_in_plain_text.com and a second one https://link_2.com"
		end

		it "should return an empty array" do
			LinkExtractor::Text.from("").should == []
		end

		it "should contain an array with 1 object" do
			LinkExtractor::Text.from(@text_1_link).count.should == 1
		end

		it "should contain an entry with 'title' equal to extracted link" do
			LinkExtractor::Text.from(@text_1_link).first[:title].should == "http://www.alink_in_plain_text.com"
		end

		it "should contain an entry with 'url' equal to extracted link" do
			LinkExtractor::Text.from(@text_1_link).first[:url].should == "http://www.alink_in_plain_text.com"
		end

		it "should contain 2 entries" do
			LinkExtractor::Text.from(@text_2_links).count.should == 2
		end

		it "should extract correctly the first link" do
			LinkExtractor::Text.from(@text_2_links).first[:url].should == "http://www.alink_in_plain_text.com"
		end

		it "should extract correctly the second link" do
			LinkExtractor::Text.from(@text_2_links).count.should == 2
		end

	end

end