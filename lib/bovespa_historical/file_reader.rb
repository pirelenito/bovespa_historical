module BovespaHistorical
  def self.read_file(filename)
    file = File.new filename, 'r'
    file.readline #ignore header
    file.lines.collect { |l| parse_line l }
  end
end