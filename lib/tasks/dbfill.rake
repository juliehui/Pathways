require 'oauth'
require 'linkedin'
require 'linkedin-scraper'
require 'thread'
 

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

########################################################
# => Make sure you fill out all the required fields
###########################################################


#profile = Linkedin::Profile.get_profile('http://www.linkedin.com/pub/meg-mahon/5a/731/a45')



task :dbfill => :environment do



	file = File.new("names.txt", "r")
	queue=[]
	counter = 0
	while (line = file.gets)
    	queue[counter] = line

    	profile = Linkedin::Profile.get_profile(line)

    	puts line

    	counter = counter + 1


	#initialize person by name
		  #person = Person.find_or_create_by_name(line)

      if (profile.first_name.nil? ) == false 
        name = (profile.first_name + " " + profile.last_name)  
        end

    #grab all fields about individual available through scraper
      if profile.first_name.nil? == false     
        first_name = profile.first_name
      else 
        first_name = ""
        end
  
      if profile.last_name.nil? == false     
        last_name = profile.last_name
      else 
        last_name = ""
        end
      
      if profile.location.nil? == false
        location = profile.location
      else 
        location = ""
        end
      
      if profile.country.nil? == false
        country = profile.country
      else 
        country = ""
        end
      
      if profile.industry.nil? == false
        industry = profile.industry
      else 
        industry = ""
        end
      
      if profile.websites.nil? == false
        pers_website = profile.websites[0]    
      else 
        pers_website = ""
      end
    
      person = Person.create({  
          :name => name,
          :profile_url => line,
          :first_name => first_name,
          :last_name => last_name,
          :pers_website => pers_website,
          :industry => industry,
          :location => location,
          :country  => country
          })
      

  
    #group school data
    if profile.education.nil? == false 
    profileEducation = profile.education
    profileEducation.each do |n|
      #grab period for start and end dates

      #dates
      if n[:period].nil? == false 
        period = n[:period]
      else 
        period = ""
      end

      #school name  
      if n[:name].nil? == false 
        name = n[:name]
      else 
        name = ""
      end

      #degree description  
      if n[:description].nil? == false 
        degree = n[:description] 
      else 
        degree = ""
      end


      #populate fields for a given school
      person.educations.create({  
        :start_date => period,
        :school => name,
        :degree => degree
        })      
    end
  end
  

    if profile.current_companies.nil? == false 
		#loop for current positions data
		currentPositions = profile.current_companies
    currentPositions.each do |n|   
      
      #dates
      if n[:current_title].nil? == false 
        title = n[:current_title]
      else 
        title = ""
      end 
        
      #school name  
      if n[:current_company].nil? == false 
        company = n[:current_company]
      else 
        company = ""
      end 
        
      #degree description  
      if n[:description].nil? == false 
        description = n[:description] 
      else 
        description = ""
      end 
        
      
       
      #populate fields for a given school
      person.positions.create({  
        :title => title,
        :company => company,
        :description => description
        })      
    end
  end
    
    
    if profile.past_companies.nil? == false
    
		#loop for past positions data
    pastPositions = profile.past_companies
    pastPositions.each do |n|    
      
      #dates
      if n[:past_title].nil? == false 
        title = n[:past_title]
      else 
        title = ""
      end 

      #school name  
      if n[:past_company].nil? == false 
        company = n[:past_company]
      else 
        company = ""
      end 

      #degree description  
      if n[:description].nil? == false 
        description = n[:description] 
      else 
        description = ""
      end 

      
      
      #populate fields for a given school
      person.positions.create({  
        :title => title,
        :company => company,
        :description => description
        })      
    end
  end
  puts person
  puts person.educations
  puts person.positions
end
end