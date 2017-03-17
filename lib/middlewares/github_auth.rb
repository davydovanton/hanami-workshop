require 'roda'

class GithubAuth < Roda
  plugin :middleware

  route do |r|
    r.on 'auth/:provider' do
      r.is 'callback' do
        login = request.env['omniauth.auth']['extra']['raw_info']['login']
        repo = AccountRepository.new
        session[:account] = repo.find_by_login(login) || repo.create(login: login)

        r.redirect "/"
      end
    end

    r.is 'failure' do
      # logging errors
    end

    r.is 'logout' do
      session[:account] = nil
      r.redirect "/"
    end
  end
end
