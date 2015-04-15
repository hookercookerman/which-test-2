require "spec_helper"

RSpec.describe Which::MechanizeWebInteractor do
  let(:interactor) { double.as_null_object }
  let(:mechanize_web_interactor) { described_class.new(interactor: interactor) }
  it "responds_to google_search" do
    expect(mechanize_web_interactor).to respond_to(:google_search)
  end
  it "responds_to click_first" do
    expect(mechanize_web_interactor).to respond_to(:click_first)
  end
end
