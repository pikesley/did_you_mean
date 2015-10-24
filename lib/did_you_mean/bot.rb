module DidYouMean
  class Bot
    def self.config custom_path = "#{ENV['HOME']}/.did_you_mean/config.yml"
      config = fetch_yaml (File.join(File.dirname(__FILE__), '..', '..', 'config/defaults.yml'))
      custom = fetch_yaml custom_path

      OpenStruct.new config.merge custom
    end

    def self.search since: 0
      results = ::Tweetster::Searcher.results config.search_term, since: since
  #    require 'pry'
  #    binding.pry
      save results.first.id
      results
    end

    def self.save id
      File.open config.last_tweet_file, 'w' do |f|
        f.write id
      end
    end

    def self.last
      File.read(config.last_tweet_file).to_i
    end

    def self.fetch_yaml path
      begin
        YAML.load File.open path
      rescue
        {}
      end
    end
  end
end
