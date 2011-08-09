describe "BovespaHistorical.line_parser" do
  before do
    @line = '012003021202VALE3       010VALE R DOCE ON           R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159'
  end
  
  subject { BovespaHistorical.parse_line(@line) }

  its(:symbol) { should == 'VALE3' }
  its(:date) { should == Date.parse('2003-12-02') }
  its(:start_price) { should == 105.01 }
  its(:max_price) { should == 105.01 }
  its(:min_price) { should == 102.5 }
  its(:price) { should == 103.21 }
end
