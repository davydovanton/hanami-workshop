module Web::Controllers::Links
  class Show
    include Web::Action

    def call(params)
      if link = repo.find_by_key(params[:id])
        repo.update(link.id, clicks: link.clicks + 1)
        redirect_to link.url
      else
        self.body = 'Not found'
      end
    end

  private

    def repo
      @repo ||= LinkRepository.new
    end
  end
end
