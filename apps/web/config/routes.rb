# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/links', to: 'links#create'
get '/links/new', to: 'links#new'
get '/links/:id', to: 'links#show'
