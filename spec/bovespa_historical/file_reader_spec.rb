describe 'BovespaHistorical.read_file' do
  describe 'given a file with one quote' do
    it 'should invoke the given block with the parsed quote' do
      count = 0
      BovespaHistorical.read_file('spec/one_quote_data.txt') { |quote| quote[:symbol].should == 'VALE3'; count+=1 }
      count.should == 1
    end
  end
  describe 'given a file with two quotes' do
    it 'should invoke the given block with each of the two parsed quotes' do
      quote_symbols = []
      BovespaHistorical.read_file('spec/two_quotes_data.txt') { |quote| quote_symbols << quote[:symbol] }
      quote_symbols.should == ['VALE3', 'RPSA4']
    end
  end
end