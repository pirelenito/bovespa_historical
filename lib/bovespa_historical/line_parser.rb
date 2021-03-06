require 'ostruct'

module BovespaHistorical
  def self.parse_line(string)
    return unless quote_registry? string
    {
      :date => Date.parse("#{string[2..5]}-#{string[6..7]}-#{string[8..9]}"),
      :symbol => string[12..23].strip,
      :market_type => string[24..26],
      :start_price => parse_float(string[56..68]),
      :max_price => parse_float(string[69..81]),
      :min_price => parse_float(string[82..94]),
      :price => parse_float(string[108..120]),
    }
  end
  
  private
  
  def self.quote_registry?(string)
    string[0..1] == '01'
  end
  
  def self.parse_float(string)
    string.to_f / 100
  end
end