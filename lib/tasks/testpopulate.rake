=begin

require 'linkedin-scraper'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
# => Make sure you fill out all the required fields
###########################################################

#profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/fitzcn')


=begin
task :scrape => :environment do

profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/fitzcn')

  
  #url of the profile
puts profile.linkedin_url
  
  #the First name of the contact
puts profile.first_name          

  #the last name of the contact
puts profile.last_name           

  #the linkedin job title
puts profile.title               

  #the location of the contact
puts profile.location           

  #the country of the contact
puts profile.country             

  #the domain for which the contact belongs
puts profile.industry            
	
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
  
#  call various commands from lexicon.txt to populate fields in database 
<<<<<<< HEAD
=end
