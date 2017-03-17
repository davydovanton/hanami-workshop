post '/links', to: 'links#create'
get '/links/new', to: 'links#new'
get '/links', to: 'links#index'
root to: 'dashboard#index'
