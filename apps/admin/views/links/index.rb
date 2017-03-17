module Admin::Views::Links
  class Index
    include Admin::View

    def links
      LinkRepository.new.for_account(current_account.id)
    end

    def short_url(link)
      "http://localhost:2300/link/#{link.key}"
    end
  end
end
