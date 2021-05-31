Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root :to => "url#index"
    resources :url, only: [:index, :new, :create, :notfound]
    get '/:id', to: 'url#shorturlclick'
    get '/url/notfound', to: 'url#notfound'
    get '/url/stats', to: 'url#stat'
end
