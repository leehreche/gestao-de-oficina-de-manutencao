require 'minitest/autorun'
require_relative '../produtos'

class MiniTestProdutos < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_editarDescricaoProduto_false_para_inteiros
    assert_equal false, Produtos.new("Fusível", 20, 0.50).editarDescricaoProduto(123)
  end

  def test_editarDescricaoProduto_true_para_strings
    assert_equal true, Produtos.new("Fusível", 20, 0.50).editarDescricaoProduto("Fusível de Vidro Pequeno")
  end

  def test_editarPrecoProduto_false_para_inteiros
    assert_equal false, Produtos.new("Fusível", 20, 0.50).editarPrecoProduto(1)
  end

  def test_editarPrecoProduto_false_para_strings
    assert_equal false, Produtos.new("Fusível", 20, 0.50).editarPrecoProduto("1.00")
  end
  
  def test_editarPrecoProduto_true_para_float
    assert_equal true, Produtos.new("Fusível", 20, 0.50).editarPrecoProduto(1.0)
  end

  def test_cadastrarEntradaProduto_false_para_floats
    assert_equal false, Produtos.new("Fusível", 20, 0.50).cadastrarEntradaProduto(1.0)
  end

  def test_cadastrarEntradaProduto_false_para_strings
    assert_equal false, Produtos.new("Fusível", 20, 0.50).cadastrarEntradaProduto("1.00")
  end
  
  def test_cadastrarEntradaProduto_true_para_inteiros
    assert_equal true, Produtos.new("Fusível", 20, 0.50).cadastrarEntradaProduto(1)
  end

  def test_cadastrarSaidaProduto_false_para_floats
    assert_equal false, Produtos.new("Fusível", 20, 0.50).cadastrarSaidaProduto(1.0)
  end

  def test_cadastrarSaidaProduto_false_para_strings
    assert_equal false, Produtos.new("Fusível", 20, 0.50).cadastrarSaidaProduto("1.00")
  end
  
  def test_cadastrarSaidaProduto_true_para_inteiros
    assert_equal true, Produtos.new("Fusível", 20, 0.50).cadastrarSaidaProduto(1)
  end

  def test_consultarProduto_true_para_retorno_com_uma_instancia_de_produto
    assert_instance_of Produtos, Produtos.new("Fusível", 20, 0.50).consultarProduto()
  end
end