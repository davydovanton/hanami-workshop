resources :links, only: %i[index new create]
root to: 'dashboard#index'
