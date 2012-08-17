Blogger::Application.routes.draw do
  
  devise_for :users
 
get "tags/index"
  get "tags/show"
get "articles/show"
 resources :articles
 resources :comments
 resources :tags

 root :to => 'articles#index'
match "/articles/:id" => "articles#new"
end
