

require 'rest-client'
module HomeHelper
	def rest_call
		response = RestClient.get 'http://ip.jsontest.com/', accept: :json
		JSON.parse(response)
	end
end
