=begin
  Problema: http://dojopuzzles.com/problemas/exibe/distribuicao-de-mictorios/

  Um problema enfrentado pelos homens no uso de mictórios em bathrooms públicos é o constrangimento causado por outro homem urinando no mictório ao lado. Uma situação contrangedora é definida quando dois "mijões" deveriam ocupar mictórios adjacentes.
  Dada uma quantidade de mictórios em um bathroom e a ocupação inicial deles (informando em qual deles já existe um "mijão"), determine quantos "mijões" ainda podem usar os mictórios e qual a posição deles antes para que não ocorra uma situação constrangedora.

  Alberto Leal - albertoleal.eti.br
=end

class Bathroom
  BUSY, FREE = false, true
  attr_accessor :mics

  def initialize(mics)
    @mics = mics
  end

  def free_mics
    return [0] if @mics.size == 1 && @mics[0]

    free = @mics.each_with_index.inject([])  do |mics, (mic, idx)|
      last_free_mic = mics.last
      last_mic      = @mics[idx - 1]

      mics << idx if (mics.empty? && @mics.size != idx +1) || (mic && (last_free_mic == idx -1 || last_mic == FREE) )

      #Remove last element from list if the next is BUSY
      mics.pop if !mic && last_free_mic == idx -1

      mics
    end

    free
  end
end


if $0 == __FILE__
  require 'test/unit'

  class BathroomTest < Test::Unit::TestCase
    BUSY, FREE = false, true

    def test_one_free_mic
      mictorios = [FREE]
      bathroom = Bathroom.new(mictorios)

      assert_equal [0], bathroom.free_mics
    end

    def test_one_busy_mic
      mictorios = [BUSY]
      bathroom = Bathroom.new(mictorios)

      assert_equal [], bathroom.free_mics
    end

    def test_two_free_mics
      mictorios = [FREE, FREE]
      bathroom = Bathroom.new(mictorios)

      assert_equal [0, 1], bathroom.free_mics
    end

    def test_two_mics
      mictorios = [FREE, BUSY]
      bathroom = Bathroom.new(mictorios)

      assert_equal [], bathroom.free_mics
    end

    def test_three_mics
      mictorios = [FREE, BUSY, FREE]
      bathroom = Bathroom.new(mictorios)

      assert_equal [], bathroom.free_mics
    end

    def test_many_free_mics
      mictorios = [FREE, FREE, FREE, FREE, FREE, FREE, FREE, FREE]
      bathroom = Bathroom.new(mictorios)

      assert_equal [0,1,2,3,4,5,6,7], bathroom.free_mics
    end

    def test_many_empty_mics
      mictorios = [FREE, BUSY, FREE, BUSY, FREE, BUSY, FREE, BUSY]
      bathroom = Bathroom.new(mictorios)

      assert_equal [], bathroom.free_mics
    end

    def test_many_mics
      mictorios = [FREE, FREE, FREE, BUSY, FREE, BUSY, FREE, FREE]
      bathroom = Bathroom.new(mictorios)

      assert_equal [0,1,7], bathroom.free_mics
    end
  end
end
