CodeCritic::Application.routes.draw do
  devise_for :users

  resources :repos

  match 'pages/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  root :to => 'high_voltage/pages#show', :id => 'index'
end
