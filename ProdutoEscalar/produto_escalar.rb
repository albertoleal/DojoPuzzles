=begin
  Coding Dojo: http://dojopuzzles.com/problemas/exibe/produto-escalar-de-vetores/

  Definimos dois vetores A e B de dimensão n em termos de componentes como:
  A = (a1, a2, a3, ..., an) e B = (b1, b2, b3, ..., bn)
  O produto escalar entre esses vetores é descrito como:
  A . B = a1 * b1 + a2 * b2 + a3 * b3 + ... + an * bn
  
  Desenvolva um programa que, dado dois vetores de dimensão n, retorne o produto escalar entre eles e o ângulo formado.
=end

class MyMath
  attr_reader :vector_a, :vector_b

  def initialize(vector_a, vector_b)
    raise ArgumentError if vector_a.size != vector_b.size
    @vector_a, @vector_b = vector_a, vector_b
  end

  def dot_product
    splat = @vector_a.each_with_index.inject(0) do |result, (el, index)|
      result += el * @vector_b[index]
    end
    [splat, MyMath::angle_type(splat)]
  end

  def self.angle_type(number)
    if number == 0
      'right'
    elsif number > 0
      "acute"
    else
      "obtuse"
    end      
  end
end

if $0 == __FILE__
  require 'test/unit'

  class MyMathTest < Test::Unit::TestCase
    def test_vectors_dimenstions_invalid
      vector_a = [1]
      vector_b = [1,2,4]      

      assert_raise ArgumentError do
        MyMath.new vector_a, vector_b
      end
    end

    def test_dot_product
      vector_a = [1,2,3]
      vector_b = [1,3,6] 

      math = MyMath.new vector_a, vector_b
      assert_equal [25, "acute"], math.dot_product()
    end

    def test_angle_acute
      assert_equal "acute", MyMath::angle_type(100)
    end

    def test_angle_right
      assert_equal "right", MyMath::angle_type(0)     
    end

    def test_angle_obtuse
      assert_equal "obtuse", MyMath::angle_type(-100)
    end

  end
end