class ApplicationController < ActionController::Base
  protect_from_forgery
end

def index
  @q = Person.search(params[:q])
  @people = @q.result(:distinct => true)
end
