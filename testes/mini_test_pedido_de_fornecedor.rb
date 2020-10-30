require 'minitest/autorun'
require_relative '../pedido_de_fornecedor'

class MiniTestPedidoDeFornecedor < Minitest::Test
  def test_editarFornecedor_false_para_float
    assert_equal false, PedidoDeFornecedor.new("08356962000190").editarFornecedor(1.2)
  end

  def test_editarFornecedor_false_para_inteiro
    assert_equal false, PedidoDeFornecedor.new("08356962000190").editarFornecedor(2)
  end

  def test_editarFornecedor_true_para_string
    assert_equal true, PedidoDeFornecedor.new("08356962000190").editarFornecedor("08356962000191")
  end 

  def test_emitirRecibo_false_quando_nao_temos_produtos_cadastrados_para_o_pedido
    assert_equal false, PedidoDeFornecedor.new(9).emitirRecibo()
  end

  def test_emitirRecibo_true_quando_temos_produtos_cadastrados_para_o_pedido

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    fornecedor = Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069")

    pedido_fornecedor = PedidoDeFornecedor.new("08356962000190")

    pedido_fornecedor.adicionarProduto(1,30)
    pedido_fornecedor.adicionarProduto(2,25)
    pedido_fornecedor.adicionarProduto(3,10)
    pedido_fornecedor.adicionarProduto(4,15)

    assert_equal true, pedido_fornecedor.emitirRecibo()
  end

  def test_consultarPedido_true_para_uma_instancia_de_pedido_de_fornecedor
    assert_instance_of PedidoDeFornecedor,  PedidoDeFornecedor.new("08356962000190").consultarPedido()
  end

  def test_consultarValorTotal_zero_para_pedido_de_fornecedor_sem_produtos
    assert_equal 0, PedidoDeFornecedor.new("08356962000190").consultarValorTotal()
  end

  def test_consultarValorTotal_maior_que_zero_para_pedido_de_fornecedor_com_produtos

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    pedido_fornecedor = PedidoDeFornecedor.new("08356962000190")

    pedido_fornecedor.adicionarProduto(1,30)
    pedido_fornecedor.adicionarProduto(2,25)
    pedido_fornecedor.adicionarProduto(3,10)
    pedido_fornecedor.adicionarProduto(4,15)

    assert_operator 0, :<, pedido_fornecedor.consultarValorTotal()
  end
  
end