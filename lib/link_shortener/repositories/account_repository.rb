class AccountRepository < Hanami::Repository
  associations do
    has_many :links
  end

  def find_by_login(login)
    accounts.where(login: login).one
  end
end
