require "spec_helper"

RSpec.describe Which::GoogleWebSearcher do
  let(:web_interactor) { double.as_null_object }
  let(:google_web_searcher) { described_class.new(web_interactor: web_interactor) }

  it "responds_to search" do
    expect(google_web_searcher).to respond_to(:search)
  end

  it "responds_to click_first" do
    expect(google_web_searcher).to respond_to(:click_first)
  end

  describe "#search" do
    let(:term) { "test" }
    it "returns a page result" do
      allow(web_interactor).to receive(:google_search) { double(search: :true) }
      expect(google_web_searcher.search(term: term)).to respond_to(:search)
    end
  end

  describe "#click_first" do
    let(:page) { double(search: true) }
    it "returns a page body" do
      allow(web_interactor).to receive(:click_first) { "result" }
      expect(google_web_searcher.click_first(page: page)).to eq("result")
    end
  end
end
