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
  end
end
