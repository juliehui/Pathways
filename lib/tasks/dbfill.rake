require 'oauth'
require 'linkedin'
require 'linkedin-scraper'
require 'thread'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
# => Make sure you fill out all the required fields
###########################################################


task :dbfill => :environment do


	file = File.new("names.txt", "r")
	queue=[]
	counter = 0
	while (line = file.gets)
    	queue[counter] = line

    	profile = Linkedin::Profile.get_profile(line)

    	puts line
    	puts queue[counter]
    	counter = counter + 1
	

		person = Person.find_or_create_by_name("Mike")

		person.age = 23

		person.educations.create({:school => "Brandeis"})

		person.educations.create({:school => "Harvard", :degree => "Phds Physics and everything"})


		event.tweets.create({
	          :text => parsed_json["text"],
	          :favorited => parsed_json["favorited"],
	          :in_reply_to_user_id_str => parsed_json["in_reply_to_user_id_str"],
	          #:geo => "null",an
	          :in_reply_to_screen_name => parsed_json["in_reply_to_screen_name"],
	          :in_reply_to_status_id => parsed_json["in_reply_to_status_id"],
	          :in_reply_to_user_id => parsed_json["in_reply_to_user_id"],
	          :source => parsed_json["source"],
	          :retweet_count => parsed_json["retweet_count"],
	          :truncated => parsed_json["truncated"],
	          #:id_str => parsed_json["id_str"],
	          #:hashtags => parsed_json["entities"]["hashtags"][1],
	          :retweeted => parsed_json["retweeted"],
	          :created_at => parsed_json["created_at"],
	          #:tweet_id => parsed_json["id"],
	          #:user_mentions => parsed_json["user_mentions"],
	          #:geo_long => parsed_json["geo_long"],
	          #:geo_lat => parsed_json["geo_lat"],
	          :statuses_count => parsed_json["user"]["statuses_count"],
	          :country => parsed_json["user"]["location"],
	          #not real? :possibly_sensitive => parsed_json["possibly_sensitive"],
	          :expanded_url => expanded,
	          :verified => parsed_json["user"]["verified"],
	          :friends_count => parsed_json["user"]["friends_count"],
	          :screenname => parsed_json["screenname"]
	          # :user_home_location => parsed_json["user_home_location"]
	          })
	end
end

