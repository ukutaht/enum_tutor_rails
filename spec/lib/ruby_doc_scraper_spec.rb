require 'spec_helper'

describe RubyDocScraper do
  describe '.find_html' do
    it 'opens the page' do
      page = double
      page.stub(:css).and_return(page)
      page.stub(:to_html)

      RubyDocScraper.should_receive(:page).and_return(page)
      RubyDocScraper.should_receive(:remove_css).twice

      RubyDocScraper.find_html("map")
    end
  end
end