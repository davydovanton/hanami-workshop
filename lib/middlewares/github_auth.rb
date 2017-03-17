require 'roda'

class GithubAuth < Roda
  plugin :middleware

  route do |r|
    r.is 'auth/failure' do
      # logging errors
    end

    r.is 'auth/logout' do
      session[:account] = nil
      r.redirect "/admin"
    end

    r.on 'auth/:provider' do
      r.is 'callback' do
        login = request.env['omniauth.auth']['extra']['raw_info']['login']
        repo = AccountRepository.new
        session[:account] = repo.find_by_login(login) || repo.create(login: login)

        r.redirect "/admin"
      end
    end
  end
end
