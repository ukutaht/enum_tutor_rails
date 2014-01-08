require 'nokogiri'
require 'open-uri'

class RubyDocScraper

  DOC_PAGE = 'http://ruby-doc.org/core-1.9.3/Enumerable.html'

  # Scrapes the ruby docs for a specific method. The argument must be the method
  # name in snakecase eg.
  # RubyDocScraper.find_html("each_with_index").

  # Question marks must be replaced by -3F eg.
  # RubyDocScraper.find_html("any-3F").


  def self.find_html(method)

    method_div = page.css("##{method}-method")

    raise "Method not found from Enumerable docs" if method_div.nil?

    # We don't want to display the C source code

    remove_css(method_div,".method-source-code")

    # Or the button to show C source

    remove_css(method_div,"span.method-click-advice")

    method_div.to_html

  end

  private

  def self.remove_css(page, selector)
    page.at_css(selector).remove
  end

  def self.page
    Nokogiri::HTML(open(DOC_PAGE))
  end


end
