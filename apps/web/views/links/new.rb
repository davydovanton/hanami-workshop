module Web::Views::Links
  class New
    include Web::View

    def last_created_link
      return unless link = LinkRepository.new.last
      "site.com/link/#{link.key}"
    end

    def form
      form_for :link, routes.links_path do
        text_field :url
        submit 'Create'
      end
    end
  end
end
