require 'minitest/autorun'
require_relative '../itens_do_pedido'

class MiniTestItensDoPedido < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_alterarQuantidadeProduto_false_para_floats
    assert_equal false, ItensDoPedido.new(1,1,12).alterarQuantidadeProduto(12.3)
  end

  def test_alterarQuantidadeProduto_false_para_strings
    assert_equal false, ItensDoPedido.new(1,1,12).alterarQuantidadeProduto("12.3")
  end

  def test_alterarQuantidadeProduto_true
    assert_equal true, ItensDoPedido.new(30,30,12).alterarQuantidadeProduto(12)
  end
end