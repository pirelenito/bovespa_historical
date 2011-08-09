require 'ostruct'

module BovespaHistorical
  def self.parse_line(string)
    OpenStruct.new(
      :date => Date.parse("#{string[2..5]}-#{string[8..9]}-#{string[6..7]}"),
      :symbol => string[12..23].strip,
      :start_price => parse_float(string[56..68]),
      :max_price => parse_float(string[69..81]),
      :min_price => parse_float(string[82..94]),
      :price => parse_float(string[108..120]),
      )
  end
  
  private
  
  def self.parse_float(string)
    string.to_f / 100
  end
end