=begin
  Problema: Anagramas http://dojopuzzles.com/problemas/exibe/anagramas/

  Escreva um programa que gere todos os anagramas potenciais de uma string.
  Por exmplo, os anagramas potenciais de "biro" são:
  biro bior brio broi boir bori
  ibro ibor irbo irob iobr iorb
  rbio rboi ribo riob roib robi
  obir obri oibr oirb orbi orib
=end

class Anagram
  attr_accessor :anagrams

  def initialize
    @anagrams = []
  end

  def self.permutation(str)
    chars = str.split(//)
    chars.permutation.to_a
  end

  def anagrams(start_with = "", end_with)
    if end_with.size <= 1
      @anagrams << start_with + end_with
    else
      string_list = end_with.split(//)

      string_list.each do |v|
        other_elements = string_list.select{|n| n != v}
        new_string = other_elements.join

        anagrams(start_with + v, new_string)
      end
    end

    @anagrams
  end
end

if $0 == __FILE__
  require 'test/unit'

  class AnagramTest < Test::Unit::TestCase
    #Using ruby's method :-)
    def test_total_anagramas
      perm = Anagram::permutation("biro")
      assert_equal 24, perm.length
    end

    def test_one_letter
      perm = Anagram.new().anagrams("b")
      assert_equal 1, perm.length
    end

    def test_two_letters
      perm = Anagram.new().anagrams("ab")
      assert_equal perm, ["ab", "ba"]
    end

    def test_three_letters
      perm = Anagram.new().anagrams("abc")
      assert_equal perm, ["abc", "acb", "bac", "bca", "cab", "cba"]
    end

    def test_total_anagramas_custom
      perm = Anagram.new().anagrams("biro")
      assert_equal 24, perm.length
    end
  end
end