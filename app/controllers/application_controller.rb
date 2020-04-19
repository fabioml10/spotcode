class ApplicationController < ActionController::Base
  #require authentication on all pages
  # before_action :authenticate_user!
  #Só não pede autenticacao na home (/)
  before_action :authenticate_user!, unless: -> { request.env['PATH_INFO'] == '/' }

  #libera chamadas de fora do app quando for json (post no ajax?)
  protect_from_forgery unless: -> { request.format.json? }

  #override
  def after_sign_in_path_for(resource)
    '/discovery'
  end

end
