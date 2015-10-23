module DidYouMean
  class Bot
    def self.search term
      ::Tweetster::Searcher.results term
    end
  end
end
