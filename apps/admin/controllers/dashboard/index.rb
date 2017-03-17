module Admin::Controllers::Dashboard
  class Index
    include Admin::Action

    def call(params)
    end

  private

    def authenticate!
      false
    end
  end
end
