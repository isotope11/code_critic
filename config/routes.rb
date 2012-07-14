CodeCritic::Application.routes.draw do

  devise_for :users, :path => "users", :controllers => { :omniauth_callbacks => "sessions", :registrations => "registrations" }
  #devise_for :users


  #match '/users/auth/:provider/callback' => 'sessions#create'
  match 'pages/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  root :to => 'high_voltage/pages#show', :id => 'index'
end
