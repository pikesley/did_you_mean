module DidYouMean
  class Bot
    def self.config custom_path = "#{ENV['HOME']}/.did_you_mean/config.yml"
      config = fetch_yaml (File.join(File.dirname(__FILE__), '..', '..', 'config/defaults.yml'))
      custom = fetch_yaml custom_path

      OpenStruct.new config.merge custom
    end

    def self.search
      ::Tweetster::Searcher.results config.search_term
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
