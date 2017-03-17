class LinkRepository < Hanami::Repository
  def find_by_key(key)
    links.where(key: key).one
  end

  def for_account(account_id)
    links.where(account_id: account_id).to_a
  end
end
