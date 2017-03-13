module Web::Controllers::Links
  class Create
    include Web::Action
    include Hanami::Action::Session

    params do
      required(:link).schema do
        required(:url).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        params[:link][:key] = '123'
        link = LinkRepository.new.create(params[:link])
        flash[:info] = "your link: site.com/link/#{link.key}"
      else
        flash[:error] = 'invalid link'
      end

      redirect_to routes.root_path
    end
  end
end
