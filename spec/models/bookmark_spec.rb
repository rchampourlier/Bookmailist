describe Bookmark do

	describe "create" do
		
		before(:all) do
			@bookmark_data = {:title => "Link title", :url => "http://link_url.com"}
		end

		it "should create a new Bookmark" do
			expect {
				Bookmark.create(@bookmark_data)
			}.to change { Bookmark.count }.by 1
		end

		it "should create a new Bookmark with the correct link" do
			b = Bookmark.create(@bookmark_data)
			b.title.should == @bookmark_data[:title]
			b.url.should == @bookmark_data[:url]
		end
	end

end