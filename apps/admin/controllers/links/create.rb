module Admin::Controllers::Links
  class Create
    include Admin::Action

    params do
      required(:link).schema do
        required(:url).filled(:str?)
      end
    end

    def call(params)
      create_link
      redirect_to routes.links_path
    end

  private

    def create_link
      return unless params.valid?

      params[:link][:key] = generate_random_key
      LinkRepository.new.create(params[:link])
    end

    def generate_random_key
      SecureRandom.hex[0..4]
    end
  end
end
