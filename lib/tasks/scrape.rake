require 'oauth'
require 'linkedin'
require 'linkedin-scraper'
require 'thread'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
# => Make sure you fill out all the required fields
###########################################################


task :scrape => :environment do

# , [:url, :queue] 
#  |t, args|


	profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/fitzcn')

	queue = []

	for i in 0..9 do
		url = profile.recommended_visitors[i][:link].value
		urlSplit = url.split("?")
		urlNew = urlSplit[0]
		queue[i] =urlNew
	end
end




##Colin testing things out below  

#initialize number of profile retrieved and seed profile
num = 0    

queue = Queue.new

profile = Linkedin::Profile.get_profile('http://www.linkedin.com/profile/view?id=137603922&locale=en_US&trk=tyah')

queue.enq(profile)

#begin crawling loop
#until num > 5000 #exit from crawl after 5000 profiles
#  currentProf = queue.deq
#    if checkDB(currentProf) == true #if found in DB already, grab new ID
#      list = currentProf.recommended_visitors
#      enqnum = 0
#      queue.enq(list[enqnum]), enqnum += 1 while enqnum < list.length
#    else
#      addToDB(currentProf)  #if not found, add to database
#      num += 1            #increase number in database
#      list = currentProf.recommended_visitors
#     enqnum = 0
#      queue.enq(list[enqnum :link]), enqnum += 1 while enqnum < list.length
#    end
#end

  
    

#  		scrape(randomID) # scrape on ID after split on the ?
