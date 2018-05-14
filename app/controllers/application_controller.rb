class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
      render html: 'Ruby on Rails'
  end
  
  include ApplicationHelper
end
