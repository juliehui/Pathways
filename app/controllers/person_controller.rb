class PersonController < ApplicationController
	def search

	end

	def index
	  @persons = Person.all
	 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @persons }
	  end
	end
end
