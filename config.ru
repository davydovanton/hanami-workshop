require './config/environment'
require './lib/middlewares/github_auth'

require 'omniauth'

use Rack::Session::Cookie, secret: ENV['SESSIONS_SECRET']

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], provider_ignores_state: true
end

use GithubAuth

run Hanami.app
