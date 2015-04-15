require "mechanize"

module Which
  class MechanizeWebInteractor
    GOOGLE_URL = "http://www.google.com"

    def initialize(interactor: Mechanize.new)
      @interactor = interactor
    end

    # @param [String] term
    # @return [Mechanize::Page]
    def google_search(term:)
      page = @interactor.get(GOOGLE_URL)
      search_form = page.form_with(name: "f")
      search_form.field_with(name: "q").value = term
      @interactor.submit(search_form)
    end

    # @param [Mechanize::Page] page
    # @param [String] page
    # @return [String]
    def click_first(search_string:, page:)
      if node = page.search(search_string).first
        Mechanize::Page::Link.new(node, @interactor, page).click.body
      end
    end
  end
end
