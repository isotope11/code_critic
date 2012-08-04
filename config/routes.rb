CodeCritic::Application.routes.draw do
  opinio_model

  devise_for :users, :path => "users", :controllers => { :omniauth_callbacks => "sessions", :registrations => "registrations" }

  resources :repos do
    member do
      get :tree
    end
    resources :commits do
      opinio
    end
  end
  resources :review_requests

  match 'repos/:id/blob/*path/' => 'repos#blob', format: false, as: :blob_repo

  resources :commits do
    opinio
  end

  resources :file_placeholders
  resources :file_line_placeholders

  match 'pages/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  root :to => 'high_voltage/pages#show', :id => 'index'
end
