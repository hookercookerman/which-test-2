require "which/mechanize_web_interactor"

module Which
  class GoogleWebSearcher
    RESULT_SELECTOR = "#res li.g a"

    # @param [#google_search, #click_first] web_interactor
    # @param [String] result_selector the css selector for results pages
    def initialize(web_interactor: MechanizeWebInteractor.new, result_selector: RESULT_SELECTOR)
      @web_interactor = web_interactor
      @result_selector = result_selector
    end

    # @params [String] term
    # @return [#search, nil] page searchable object or nil
    def search(term:)
      @web_interactor.google_search(term: term)
    end

    # @params [#click_first] page
    # @return [String]
    def click_first(page:)
      @web_interactor.click_first(search_string: @result_selector, page: page)
    end
  end
end
