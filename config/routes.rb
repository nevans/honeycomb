ActionController::Routing::Routes.draw do |map|
  map.resources :payments, :collection => { :checkout => :post }, :member => { :confirm => :get, :complete => :post }

  map.root :controller => "appearances"
  map.resources :devices, :member => {:claim => :get, :assign => :post}

  map.logout '/logout', :controller => :people, :action => :logout
  map.confirm_login '/confirm_login/:id', :controller => :people, :action => :confirm_login, :conditions => {:method => :post}

  map.resources :people, :member => { :activity => :get, :confirm_device_for => :get, :contact => :get, :login => :get, :email_password => :get }
    
  map.oauth_connect 'oauth/:action', :controller => "oauth"
  map.oauth 'oauth/:action', :controller => "oauth"
end
