class ApplicationController < ActionController::Base
  #require authentication on all pages
  before_action :authenticate_user!

  #libera chamadas de fora do app quando for json (post no ajax?)
  protect_from_forgery unless: -> { request.format.json? }
end
