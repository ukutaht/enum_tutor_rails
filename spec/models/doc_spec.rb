require 'spec_helper'

describe Doc do
  it 'finds relevant documentation' do
    RubyDocScraper.should_receive(:find_html).with('map').and_return('whatever')
    Doc.create(method: 'map')
  end
end
