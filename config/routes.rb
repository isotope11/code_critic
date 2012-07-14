CodeCritic::Application.routes.draw do

  opinio_model

  devise_for :users, :path => "users", :controllers => { :omniauth_callbacks => "sessions", :registrations => "registrations" }
  #devise_for :users


  #match '/users/auth/:provider/callback' => 'sessions#create'
  resources :repos do
    resources :commits do
      opinio
    end
  end

  resources :commits do
    opinio
  end

  match 'pages/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  root :to => 'high_voltage/pages#show', :id => 'index'
end
