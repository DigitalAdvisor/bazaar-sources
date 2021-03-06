require 'sources/source'
require 'sources/amazon_source'
require 'sources/buy_source'
require 'sources/ebay_source'
require 'sources/epinions_source'
require 'sources/google_source'
require 'sources/price_grabber_source'
require 'sources/reseller_ratings_source'
require 'sources/shopping_source'
require 'sources/shopzilla_source'

module BazaarSources
  VERSION = '0.1.8'
end

module URI
  CHARACTERS_DISLIKED_BY_PARSE = '^<>`| '
  def self.safe_parse(url)
    escaped = URI.escape(url, CHARACTERS_DISLIKED_BY_PARSE)
    uri = URI.parse(escaped)
    uri
  end
end

# 1.9.1 patch
if ''.respond_to?(:force_encoding)
  module Hpricot
    module Traverse
      def inner_text
        if respond_to?(:children) and children
          children.map { |x| x.inner_text.force_encoding('UTF-8') }.join
        else
          ""
        end
      end
    end
  end
end