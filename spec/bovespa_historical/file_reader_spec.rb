describe 'BovespaHistorical.read_file' do
  describe 'given one known test data' do
    subject do
      BovespaHistorical.read_file 'spec/test_data.txt'
    end
  
    it 'should have parsed 3 stocks' do
      subject.length.should == 3
    end
  
    it 'should have one the VALE3 quote' do
      subject.select do |s| 
        s.symbol == 'VALE3'
      end.length.should == 1
    end
    
    it 'should have one the VALE5 quote' do
      subject.select do |s| 
        s.symbol == 'VALE5'
      end.length.should == 1
    end
    
    it 'should have one the TMCP4F quote' do
      subject.select do |s| 
        s.symbol == 'TMCP4F'
      end.length.should == 1
    end
  end
end