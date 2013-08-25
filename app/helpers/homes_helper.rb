module HomesHelper
	require 'open-uri'
	require 'json'
	def cast(url)
		buffer = open(url).read
		result = JSON.parse(buffer)
		return result
	end
end
