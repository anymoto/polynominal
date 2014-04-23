require 'pry-nav'

class Polynominal
  attr_reader :coeffs

  def initialize(array)
    array.reject! { |a| a.is_a?(String) }
    if array.length > 2
      @coeffs = array
    else
      raise 'Please provide at least two coefficients'
    end
  end

  def to_s
    length = @coeffs.length - 1

    substring = "#{@coeffs.first}x^#{length}" if (@coeffs.first > 1)
    substring = "x^#{length}" if (@coeffs.first == 1 && length > 1)
    substring = "#{@coeffs.first}x" if (@coeffs.first > 1 && length == 1)

    @coeffs.slice!(0)

    @coeffs.each do |element|
      element > 0 ? sign = '+' : sign = '-'
      length -= 1

      unless element == 0
        substring += " #{sign} x^#{length}" if (element.abs == 1 && length > 1)
        substring += " #{sign} #{element.abs}x^#{length}" if (element.abs > 1 && length > 1)
        substring += " #{sign} #{element.abs}x" if (element.abs > 1 && length == 1)
        substring += " #{sign} #{element.abs}" if length == 0
      end
    end

    substring
  end

end
