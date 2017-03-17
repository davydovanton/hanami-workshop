module Admin::Views::Links
  class Index
    include Admin::View

    def links
      LinkRepository.new.all
    end
  end
end
