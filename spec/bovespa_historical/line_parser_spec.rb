describe "BovespaHistorical.line_parser" do
  context 'given one valid quote line' do
    before do
      @line = '012003021202VALE3       010VALE R DOCE ON           R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159'
    end
  
    subject { BovespaHistorical.parse_line(@line) }

    it { subject[:symbol].should == 'VALE3' }
    it { subject[:date].should == Date.parse('2003-12-02') }
    it { subject[:start_price].should == 105.01 }
    it { subject[:max_price].should == 105.01 }
    it { subject[:min_price].should == 102.5 }
    it { subject[:price].should == 103.21 }
    it { subject[:market_type].should == '010' }
  end
  
  context 'given a header' do 
    before do
      @line = '00COTAHIST.2003BOVESPA 20040531                                                                                                                                                                                                                      '
    end
    subject { BovespaHistorical.parse_line(@line) }
    
    it { should be_nil }
  end
  
  context 'given a trailer' do 
    before do
      @line = '99COTAHIST.2003BOVESPA 2004053100000000003                                                                                                                                                                                                           '
    end
    subject { BovespaHistorical.parse_line(@line) }
    
    it { should be_nil }
  end
end
