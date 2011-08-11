module BovespaHistorical
  def self.read_file(filename)
    file = File.new filename, 'r'
    file.each_line do |l| 
      result = parse_line l
      yield result if result
    end
  end
end