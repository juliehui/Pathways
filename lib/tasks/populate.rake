require 'linkedin-scraper'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
# => Make sure you fill out all the required fields
###########################################################

#profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/fitzcn')


=begin
task :scrape => :environment do

#get list
list = 



list.each do |n|
  profile = Linkedin::Profile.get_profile('#{n}') #figure out how to pass "n" as parameter in the method
  
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
	  n[:past_company]
	  #past company [1] title of position
	  n[:past_title]
	  #past company [1] website of company
	  n[:past_company_website]
	  #past company [1] description of position //PROBABLY NIL FOR A LOT OF PEOPLE
	  n[:description]
  end
  
  #create loop to grab data from current companies lis
  currentCompanies = profile.current_companies
  currentCompanies.each do |n|
    #current position title
    n[:title]
    #current company name
    n[:current_company]
    #current company link
    n[:current_company_url]
    #description of position
    n[:description]
  end
            

  profileGroups = profile.groups
  profileGroups.each do |n|
    #name of group
    n[:name]
    #link of a group
    n[:link]
  end
  
  profileEducation = profile.education
  profileEducation.each do |n|
    #name an education institution
    n[:name]
    #description of degree
    n[:description]
    #time at education institution
    n[:period]
  end
  
#  call various commands from lexicon.txt to populate fields in database 

end

=end
