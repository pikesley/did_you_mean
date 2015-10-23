module DidYouMean
  describe Bot do
    it 'has search results', :vcr do
      expect(described_class.search('hoard of')).to be_an Array
    end

    it 'has kosher results', :vcr do
    end
  end
end
