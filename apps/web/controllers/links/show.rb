module Web::Controllers::Links
  class Show
    include Web::Action

    def call(params)
      if link = LinkRepository.new.find(params[:id])
        redirect_to link.url
      else
        self.body = 'Not found'
      end
    end
  end
end
