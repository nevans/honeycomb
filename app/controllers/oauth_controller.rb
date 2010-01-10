class OauthController < ApplicationController

  # Connect a particular user to foursquare
  def foursquare
    request_token = FoursquareOauth.get_request_token
    puts "storing #{request_token.token} and #{request_token.secret}"
    fu = Person.find(params[:person_id]).build_foursquare_user
    fu.token = request_token.token
    fu.secret = request_token.secret
    fu.save
    redirect_to request_token.authorize_url
  end
  
  # Callback from foursquare oauth
  def setup_foursquare
    person = FoursquareOauth.complete(params[:oauth_token])
    redirect_to person_path(person)
  end
  
  def twitter
    request_token = TwitterOauth.get_request_token
    puts "storing #{request_token.token} and #{request_token.secret}"
    tu = Person.find(params[:person_id]).build_twitter_user
    tu.token = request_token.token
    tu.secret = request_token.secret
    tu.save
    redirect_to request_token.authorize_url
  end
  
  def setup_twitter
  end
  
end