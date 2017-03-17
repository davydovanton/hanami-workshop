class Account < Hanami::Entity
  def registred?
    !!id
  end
end
