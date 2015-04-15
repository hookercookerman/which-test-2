require "spec_helper"

RSpec.describe Which::GoogleWebSearcher do
  let(:searcher) { described_class.new }

  context "when 'which university' is first google result" do
    let(:google_home_page)   { File.new(File.expand_path("../../fixtures/google.txt" ,__FILE__)) }
    let(:google_redirect)    { File.new(File.expand_path("../../fixtures/google_redirect.txt" ,__FILE__)) }
    let(:google_result_page) { File.new(File.expand_path("../../fixtures/google_result.txt" ,__FILE__)) }
    let(:which_university)   { File.new(File.expand_path("../../fixtures/which_university.txt" ,__FILE__)) }

    before do
      stub_request(:get, /.*google\.com.*/).to_return(google_redirect)
      stub_request(:get, /.*google.co.uk\/(?:(?!search).)*/).to_return(google_home_page)
      stub_request(:get, /.*google\.co.uk\/search.*/).to_return(google_result_page)
      stub_request(:get, "http://university.which.co.uk").to_return(which_university)
    end

    describe "#search" do
      let(:term) { 'which university' }
      it "returns page with 'which university as the first result'" do
        expect(searcher.search(term: term).body).to include("http://university.which.co.uk")
      end
    end

    describe "#click_first" do
      let(:term) { 'which university' }
      let(:page) { searcher.search(term: term) }
      it "returns the which university page" do
        expect(searcher.click_first(page: page)).to include("What to study, where to go and how to get there...")
      end
    end
  end
end
