class ApplicationController < ActionController::Base
  #require authentication on all pages
  before_action :authenticate_user!
end
