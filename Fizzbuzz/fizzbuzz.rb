=begin
 Problema: http://dojopuzzles.com/problemas/exibe/fizzbuzz/
 
 Neste problema, você deverá exibir uma lista de 1 a 100, um em cada linha, com as seguintes exceções:
 Números divisíveis por 3 deve aparecer como 'Fizz' ao invés do número;
 Números divisíveis por 5 devem aparecer como 'Buzz' ao invés do número;
 Números divisíveis por 3 e 5 devem aparecer como 'FizzBuzz' ao invés do número'.
 
 Alberto Leal - albertoleal.eti.br
=end

class Fizzbuzz
  def self.fizzbuzz(num)
    str = ""
    str << "fizz" if num.modulo(3).zero?
    str << "buzz" if num.modulo(5).zero?
    str << num.to_s if str.empty?

    str
  end
end

#Running the tests: rspec --color fizzbuzz.rb
if $0 == __FILE__
  require "test/unit"
  
  class FizzbuzzTest < Test::Unit::TestCase
    def test_multiple_of_3
      assert_equal("fizz", Fizzbuzz::fizzbuzz(3))
      assert_equal("fizz", Fizzbuzz::fizzbuzz(33))
    end
    
    def test_multiple_of_5
      assert_equal("buzz", Fizzbuzz::fizzbuzz(5))
      assert_equal("buzz", Fizzbuzz::fizzbuzz(50))
    end
    
    def test_multiple_of_3_and_5
      assert_equal("fizzbuzz", Fizzbuzz::fizzbuzz(15))
      assert_equal("fizzbuzz", Fizzbuzz::fizzbuzz(30))
    end
  end

else
  
end

=begin
  #Calling our app
  (1..100).each do |num|
    fb = Fizzbuzz::fizzbuzz num 
    p fb unless fb.nil? 
  end
=end