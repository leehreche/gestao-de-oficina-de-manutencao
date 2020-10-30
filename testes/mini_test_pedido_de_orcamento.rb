require 'minitest/autorun'
require_relative '../pedido_de_orcamento'

class MiniTestPedidoDeOrcamento < Minitest::Test

  status = Status.new(1,"Aguardando aprovação cliente")
  status = Status.new(2,"Aguardando aprovação cliente")

  def test_editarTipoAparelho_false_para_floats
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarTipoAparelho(12.3)
  end

  def test_editarTipoAparelho_false_para_strings
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarTipoAparelho("123")
  end

  def test_editarTipoAparelho_true_para_inteiros
    assert_equal true, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarTipoAparelho(123)
  end

  def test_editarCliente_false_para_floats
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarCliente(12.3)
  end

  def test_editarCliente_false_para_strings
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarCliente("123")
  end

  def test_editarCliente_true_para_inteiros
    assert_equal true, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarCliente(123)
  end

  def test_editarValorMaoDeObra_false_para_inteiros
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarValorMaoDeObra(12)
  end

  def test_editarValorMaoDeObra_false_para_strings
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarValorMaoDeObra("123")
  end

  def test_editarValorMaoDeObra_true_para_floats
    assert_equal true, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarValorMaoDeObra(120.00)
  end

  def test_editarStatusAutorizacao_false_para_floats
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarStatusAutorizacao(2.3)
  end

  def test_editarStatusAutorizacao_false_para_strings
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarStatusAutorizacao("2")
  end

  def test_editarStatusAutorizacao_true_para_inteiros
    assert_equal true, PedidoDeOrcamento.new(230.00, 11111111111, 1).editarStatusAutorizacao(2)
  end

  def test_consultarStatusAutorizacao_true_para_strings    
    assert_instance_of String, PedidoDeOrcamento.new(230.00, 11111111111, 1).consultarStatusAutorizacao()
  end

  def test_emitirRecibo_false_quando_nao_temos_produtos_cadastrados_para_o_pedido
    assert_equal false, PedidoDeOrcamento.new(230.00, 11111111111, 1).emitirRecibo()
  end

  def test_emitirRecibo_true_quando_temos_produtos_cadastrados_para_o_pedido

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    cliente = Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999")

    tipo_aparelho = TipoDeAparelhos.new("Microondas", 20)

    pedido_orcamento = PedidoDeOrcamento.new(230.00, 11111111111, 1)

    pedido_orcamento.adicionarProduto(1,30)
    pedido_orcamento.adicionarProduto(2,25)
    pedido_orcamento.adicionarProduto(3,10)
    pedido_orcamento.adicionarProduto(4,15)

    assert_equal true, pedido_orcamento.emitirRecibo()
  end

  def test_consultarPedido_true_para_uma_instancia_de_pedido_de_orcamento
    assert_instance_of PedidoDeOrcamento,  PedidoDeOrcamento.new(230.00, 11111111111, 1).consultarPedido()
  end

  def test_consultarValorTotal_valorMaoDeObra_para_pedido_de_orcamento_sem_produtos
    assert_equal 230.00, PedidoDeOrcamento.new(230.00, 11111111111, 1).consultarValorTotal()
  end

  def test_consultarValorTotal_maior_que_zero_para_pedido_de_orcamento_com_produtos

    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)

    pedido_orcamento = PedidoDeOrcamento.new(230.00, 11111111111, 1)

    pedido_orcamento.adicionarProduto(1,30)
    pedido_orcamento.adicionarProduto(2,25)
    pedido_orcamento.adicionarProduto(3,10)
    pedido_orcamento.adicionarProduto(4,15)

    assert_operator 0, :<, pedido_orcamento.consultarValorTotal()
  end
end