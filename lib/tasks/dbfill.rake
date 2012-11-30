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
	
	#initialize person by name
		person = Person.find_or_create_by_name(profile.first_name + " " + profile.last_name)

    #group school data
    profileEducation = profile.education
    profileEducation.each do |n|
      person.educations.create({
        :school => n[:name],
        :degree => n[:description]    
        })      
TODO 
      #time at education institution
#      n[:period]
    end
		person.educations.create({:school => profile.education[0][:name]})

		person.educations.create({:school => "Harvard", :degree => "Phds Physics and everything"})



    #url of the profile
    profile.linkedin_url

    #the First name of the contact
    profile.first_name          

    #the last name of the contact
    profile.last_name           

    #the linkedin job title
    profile.title               

    #the location of the contact
    profile.location           

    #the country of the contact
    profile.country             

    #the domain for which the contact belongs
    profile.industry            

  	#create loop to grab data from past companies
  	pastCompanies = profile.past_companies
  	pastCompanies.each do |n|
  	  #past company [1] name of company  
  	 puts n[:past_company]
  	  #past company [1] title of position
  	  puts n[:past_title]
  	  #past company [1] website of company
  	  puts n[:past_company_website]
  	  #past company [1] description of position //PROBABLY NIL FOR A LOT OF PEOPLE
  	  puts n[:description]
    end

    #create loop to grab data from current companies lis
    currentCompanies = profile.current_companies
    currentCompanies.each do |n|
      #current position title
      puts n[:title]
      #current company name
      puts n[:current_company]
      #current company link
      puts n[:current_company_url]
      #description of position
      puts n[:description]
    end


    profileGroups = profile.groups
    profileGroups.each do |n|
      #name of group
      puts n[:name]
      #link of a group
      puts n[:link]
    end

    profileEducation = profile.education
    profileEducation.each do |n|
      #name an education institution
      puts n[:name]
      #description of degree
      puts n[:description]
      #time at education institution
      puts n[:period]
    end
		


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

