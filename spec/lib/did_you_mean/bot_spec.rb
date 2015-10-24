module DidYouMean
  describe Bot do
    it 'has a config' do
      expect(described_class.config.search_term).to eq 'hoard of'
    end

    it 'has search results', :vcr do
      expect(described_class.search).to be_an Array
    end

    it 'has kosher results', :vcr do
      expect(described_class.search.first.text).to match /hoard of/
    end

    it 'knows the id of the last tweet', :vcr do
      expect(described_class.last).to eq 657916485667573760
    end

    it 'only finds tweets newer than the last tweet', :vcr do
      File.open 'last.tweet', 'w' do |f|
        f.write '657916485667573760'
      end
      expect(described_class.search(since: described_class.last).count).to eq 6
    end
  end
end
