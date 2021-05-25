class SocialUpdatesRetriver
	require 'net/http'
	attr_reader :social_network_output #defined object attribute

	#Defined the constanct for the given Social sites and used the freeze here.
	SOCIAL_SITES = {
		twitter: {
			url: 'https://takehome.io/twitter', 
			response_key: 'tweet'
		},
		facebook: {
			url: 'https://takehome.io/facebook',
			response_key: 'status'
		}, 
		instagram: {
			url: 'https://takehome.io/instagram',
			response_key: 'photo'} #here response key assumed as 'photo', it has been concluded from the above two urls response.
		}.freeze

	def initialize
		@social_network_output = {twitter: [], facebook:[], instagram:[]} #Initializing the response with empty array for respective sites.
	end

	def self.get_updates
		new.fetch_individual_data #code is refactored to object level, that is why method is defiend as self and new keyword is used before calling the fetch_individual_data method, which will define the social_network_output object attribute defined in attr_reader 
	end

	def fetch_individual_data
		SOCIAL_SITES.each do |site, site_data| #{key ,value} where key will be kid of social site and value will be related site data{ site_url, response_key}
			uri = URI(site_data[:url])
			response = Net::HTTP.get_response(uri)
			if response.code == "200" #Only if we get the succesfull response(i.e 200 OK) then only extract the information from the response
				parsed_response = JSON.parse(response.body)
				social_network_output[site.to_sym] = parsed_response.map{ |t| t[site_data[:response_key]]} 
			end
		end
		social_network_output
	end
end