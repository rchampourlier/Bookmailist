module LinkExtractor

	class HTML

		class << self

			def from(html)
				doc = Nokogiri::HTML(html)
				
				results = doc.css('a').collect do |link|
					{ :title 	=> link.content,
						:url		=> link["href"]
					}
				end
			end

		end

	end

	class Text

		class << self

			def from(text)
				url = text.scan(%r{https?://(?:[^\s]+)}).collect do |url|
					{ :title  => url,
						:url 		=> url
					}
				end
			end

		end

	end

end