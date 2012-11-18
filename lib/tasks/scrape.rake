require 'oauth'
require 'linkedin'
require 'linkedin-scraper'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
#
# => Make sure you fill out all the required fields
#
#
#
###########################################################


task :scrape => :environment do
	# Fill the keys and secrets you retrieved after registering your app
	# is part of the scraper code
	profile = Linkedin::Profile.get_profile('http://www.linkedin.com/profile/view?id=137603922&locale=en_US&trk=tyah')
	#puts profile.inspect


	# is part of the linkedin api calls
	client = LinkedIn::Client.new('x7ibdmirpt9l', '5LENvBwcdRgu5ZIH')
	puts client
	rtoken = client.request_token.token
	rsecret = client.request_token.secret
	read = puts client.authorize_from_access("a6665d58-4912-41ec-b0b6-3ac172f0e417", "62f20bb7-2b7a-411c-9f5b-e45e5e3a492f")
	puts read

	test = client.profile(:id => 'fitzcn')

	puts test


end