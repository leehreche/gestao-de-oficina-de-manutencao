require 'minitest/autorun'
require_relative '../pedidos'

class MiniTestPedidos < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_adicionarProduto_false_para_strings
    assert_equal false, Pedidos.new(1).adicionarProduto("1",30)
    assert_equal false, Pedidos.new(1).adicionarProduto(1,"30")
  end

  def test_adicionarProduto_false_para_floats
    assert_equal false, Pedidos.new(1).adicionarProduto(1.0,30)
    assert_equal false, Pedidos.new(1).adicionarProduto(30,30.7)
  end

  def test_adicionarProduto_true_para_inteiros
    assert_equal true, Pedidos.new(1).adicionarProduto(1,30)
  end

  def test_editarProduto_false_para_strings
    assert_equal false, Pedidos.new(1).editarProduto("1",30)
    assert_equal false, Pedidos.new(1).editarProduto(1,"30")
  end

  def test_editarProduto_false_para_floats
    assert_equal false, Pedidos.new(1).editarProduto(1.0,30)
    assert_equal false, Pedidos.new(1).editarProduto(30,30.7)
  end

  def test_editarProduto_false_para_inteiros_e_produto_nao_cadastrado
    assert_equal true, Pedidos.new(1).adicionarProduto(1,30)
    assert_equal false, Pedidos.new(1).editarProduto(100,30)
  end

  def test_editarProduto_true_para_inteiros_e_produto_cadastrado
    assert_equal true, Pedidos.new(1).adicionarProduto(2,30)
    assert_equal true, Pedidos.new(1).editarProduto(2,30)
  end

  def test_retirarProduto_false_para_strings
    assert_equal false, Pedidos.new(1).retirarProduto("1")
  end

  def test_retirarProduto_false_para_floats
    assert_equal false, Pedidos.new(1).retirarProduto(1.0)
  end

  def test_retirarProduto_false_para_inteiros_e_produto_nao_cadastrado
    assert_equal true, Pedidos.new(1).adicionarProduto(3,30)
    assert_equal false, Pedidos.new(1).retirarProduto(100)
  end

  def test_retirarProduto_true_para_inteiros_e_produto_cadastrado
    assert_equal true, Pedidos.new(1).adicionarProduto(4,30)
    assert_equal true, Pedidos.new(1).retirarProduto(4)
  end

  def test_emitirRecibo_false_quando_nao_temos_produtos_cadastrados_para_o_pedido
    assert_equal false, Pedidos.new(2).emitirRecibo()
  end

  def test_emitirRecibo_true_quando_temos_produtos_cadastrados_para_o_pedido

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    Pedidos.new(1).adicionarProduto(1,30)
    Pedidos.new(1).adicionarProduto(2,25)
    Pedidos.new(1).adicionarProduto(3,10)
    Pedidos.new(1).adicionarProduto(4,15)

    assert_equal true, Pedidos.new(1).emitirRecibo()
  end

  def test_consultarPedido_true_para_uma_instancia_de_pedido
    assert_instance_of Pedidos, Pedidos.new(1).consultarPedido()
  end

  def test_consultarValorTotal_zero_para_pedidos_sem_produtos
    assert_equal 0, Pedidos.new(2).consultarValorTotal()
  end

  def test_consultarValorTotal_maior_que_zero_para_pedidos_com_produtos

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    Pedidos.new(1).adicionarProduto(1,30)
    Pedidos.new(1).adicionarProduto(2,25)
    Pedidos.new(1).adicionarProduto(3,10)
    Pedidos.new(1).adicionarProduto(4,15)

    assert_operator 0, :<, Pedidos.new(1).consultarValorTotal()
  end

end