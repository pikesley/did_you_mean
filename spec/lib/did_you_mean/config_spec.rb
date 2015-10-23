module DidYouMean
  describe Config do
    let(:conf) { DidYouMean::Config.instance.config }

    it 'has defaults' do
      expect(conf['search_term']).to eq 'hoard of'
    end
  end
end
