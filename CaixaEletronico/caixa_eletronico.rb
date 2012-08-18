class Caixa
  NOTAS = [100, 50 , 20, 10]
  
  def sacar(valor)
    quant = {}  
    NOTAS.each do |nota|
      if(valor / nota > 0)
        quant[nota] = valor / nota 
        valor -= quant[nota] * nota
      end
      break if valor.zero?
    end  
    
    print_result(quant)   
  end
  
  private
  def print_result(qtd_notas)
    retorno = "Entregar "
    qtd_notas.each do |nota, quantidade|
      retorno << "#{quantidade} notas de #{nota} e "
    end

    retorno[0..-3] << "reais"    
  end
end

if $0 == __FILE__
  require 'test/unit'

  class CaixaTest < Test::Unit::TestCase
    def test_notas
      assert_equal([100, 50, 20, 10], Caixa::NOTAS) 
    end
    
    def setup
      @caixa = Caixa.new
    end
    
    # Checa se existe o metodo sacar
    def test_exist_sacar
      assert @caixa.respond_to? :sacar
    end
    
    
    # Sacar 10 reais deveria returnar a mensagem correta
    def test_sacar_dez_reais
      assert_equal('Entregar 1 notas de 10 reais', @caixa.sacar(10))
    end
    
    def test_sacar_vinte_reais
      assert_equal('Entregar 1 notas de 20 reais', @caixa.sacar(20))
    end
    
    def test_sacar_trinta_reais
      assert_equal('Entregar 1 notas de 20 e 1 notas de 10 reais', @caixa.sacar(30))
    end
    
    def test_sacar_quarenta_reais
      assert_equal("Entregar 2 notas de 20 reais", @caixa.sacar(40))
    end
    
    def test_sacar_sessenta_reais
      assert_equal("Entregar 1 notas de 50 e 1 notas de 10 reais", @caixa.sacar(60))
    end
    
    def test_sacar_oitenta_reais
      assert_equal("Entregar 1 notas de 50 e 1 notas de 20 e 1 notas de 10 reais", @caixa.sacar(80))
    end
  end
end
