module Authentication
  def self.included(action)
    action.class_eval do
      expose :current_account
    end
  end

private

  def authenticate!
    redirect_to('/admin') unless authenticated?
  end

  def authenticated?
    current_account.registred? && current_account.admin
  end

  def current_account
    @current_account ||= Account.new(session[:account])
  end
end
