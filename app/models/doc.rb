class Doc < ActiveRecord::Base
  attr_accessible :challenge_id, :html, :method

  belongs_to :challenge

  before_save do
    self.html = RubyDocScraper.find_html(self.method)
  end
  
end
