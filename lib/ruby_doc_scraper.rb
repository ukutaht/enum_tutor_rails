require 'nokogiri'
require 'open-uri'

class RubyDocScraper


  # Scrapes the ruby docs for a specific method. The argument must be the method
  # name in snakecase eg. 

  # RubyDocScraper.find_html("each_with_index").
  
  # Question marks must be replaced by -3F eg. 
  
  # RubyDocScraper.find_html("any-3F").


  def self.find_html(method)
    page = Nokogiri::HTML(open('http://ruby-doc.org/core-1.9.3/Enumerable.html'))
    method_div = page.css("##{method}-method")
    
    # We don't want to display the C source code

    source_div = method_div.at_css(".method-source-code")
    source_div.remove
    
    # Or the button to show C source

    toggle_source = method_div.at_css("span.method-click-advice")
    toggle_source.remove
    
    return method_div.to_html

  end


end
