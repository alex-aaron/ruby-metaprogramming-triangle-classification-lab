class Triangle
  
  attr_accessor :length1, :length2, :length3
  
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    if triangle_inequality? || lengths_less_than_one
      begin
        raise TriangleError
      end
    elsif @length1 == @length2 && @length1 == @length3
      return :equilateral
    elsif @length1 == @length2 || @length1 == @length3 || @length2 == @length3
      return :isosceles
    elsif @length1 != @length2 && @length1 != @length3 && @length2 != @length3
      return :scalene
    end
  end

  def triangle_inequality?
    sum1 = @length1 + @length2
    sum2 = @length2 + @length3
    sum3 = @length1 + @length3
    if sum1 <= @length3 || sum2 <= @length1 || sum3 <= @length2
      true 
    end
  end

  def lengths_less_than_one
    if @length1 <= 0 || @length2 <= 0 || @length3 <= 0
      true
    end
  end

  class TriangleError < StandardError
    def message
      puts "Triange is invalid"
    end
  end
end
