require 'minitest/autorun'
require_relative '../funcionarios'

class MiniTestFuncionarios < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_editarCargo_false_para_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").editarCargo(123)
  end

  def test_editarCargo_false_para_floats
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").editarCargo(12.3)
  end

  def test_editarCargo_true_para_strings
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").editarCargo("Hacker")
  end

  def test_realizarPedidoOrcamento_false_para_strings
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoOrcamento("11111111111",1,230.00)
  end

  def test_realizarPedidoOrcamento_false_para_floats_e_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoOrcamento(11111.111111,1,230.00)
  end

  def test_realizarPedidoOrcamento_true_para_inteiros_e_floats
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoOrcamento(11111111111,1,230.00)
  end

  def test_realizarPedidoFornecedor_false_para_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoFornecedor(18265526)
  end

  def test_realizarPedidoFornecedor_false_para_floats
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoFornecedor(0.82655260001)
  end

  def test_realizarPedidoFornecedor_true_para_strings
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarPedidoFornecedor("082655260001")
  end

  def test_realizarCadastroFornecedor_false_para_cnpj_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroFornecedor(8356962000190, "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069")
  end

  def test_realizarCadastroFornecedor_false_para_cnpj_floats
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroFornecedor(0.8356962000190, "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069")
  end

  def test_realizarCadastroFornecedor_true_para_tudo_strings
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroFornecedor("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069")
  end

  def test_realizarCadastroCliente_false_para_telefone_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroCliente(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", 35999999999)
  end

  def test_realizarCadastroCliente_false_para_cpf_floats
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroCliente(11111.111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "35999999999")
  end

  def test_realizarCadastroCliente_true_para_cpf_inteiro_e_restante_string
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroCliente(22222222222, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999")
  end

  def test_realizarCadastroProduto_false_para_quantidade_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroProduto("Fusível", 20.98, 0.50)
  end

  def test_realizarCadastroProduto_false_para_preco_inteiro
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroProduto("Fusível", 20, 1)
  end

  def test_realizarCadastroProduto_true_para_descricao_string_quantidade_inteiro_preco_inteiro
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroProduto("Fusível", 20, 0.50)
  end

  def test_realizarBaixaEstoqueProduto_false_para_produto_inexistente
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarBaixaEstoqueProduto(20,200)
  end

  def test_realizarBaixaEstoqueProduto_false_para_produto_existente_quantidade_insuficiente
    produto = Produtos.new("Fusível", 100, 0.50)
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarBaixaEstoqueProduto(1,200)
  end

  def test_realizarBaixaEstoqueProduto_true_para_produto_existente_quantidade_suficiente
    produto = Produtos.new("Fusível", 100, 0.50)
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarBaixaEstoqueProduto(1, 20)
  end

  def test_realizarCadastroTipoAparelho_false_para_prazo_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroTipoAparelho("Microondas", 20.0)
  end

  def test_realizarCadastroTipoAparelho_true_para_descricao_string_prazo_inteiro
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroTipoAparelho("Microondas", 20)
  end

  def test_realizarCadastroServico_false_para_id_pedido_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroServico(1.0,1,"Manutenção de um Microondas")
  end

  def test_realizarCadastroServico_false_para_id_aparelho_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroServico(1,"1","Manutenção de um Microondas")
  end

  def test_realizarCadastroServico_true_para_id_pedido_inteiro_id_aparelho_inteiro_descricao_string
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarCadastroServico(1,1,"Manutenção de um Microondas")
  end

  def test_realizarEmissaoRecibo_false_para_inteiro
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo(1)
  end

  def test_realizarEmissaoRecibo_false_para_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo("PedidoCliente")
  end

  def test_realizarEmissaoRecibo_false_para_pedido_orcamento_sem_produto
    pedidoOrcamento = PedidoDeOrcamento.new(230.00, 11111111111, 1)
    pedidoOrcamento2 = PedidoDeOrcamento.new(230.00, 11111111112, 1)
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo(pedidoOrcamento2)
  end

  def test_realizarEmissaoRecibo_false_para_pedido_fornecedor_sem_produto
    pedidoFornecedor = PedidoDeFornecedor.new("08356962000190")
    pedidoFornecedor2 = PedidoDeFornecedor.new("08356962000192")
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo(pedidoFornecedor2)
  end

  def test_realizarEmissaoRecibo_true_para_pedido_orcamento_com_produtos_cadastrados
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

    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo(pedido_orcamento)
  end

  def test_realizarEmissaoRecibo_true_para_pedido_fornecedor_com_produtos_cadastrados
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

    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").realizarEmissaoRecibo(pedido_fornecedor)
  end

  def test_assumirServico_false_para_id_servico_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").assumirServico(1.0)
  end

  def test_assumirServico_false_para_id_servico_int
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").assumirServico(1)
  end

  def test_assumirServico_false_para_id_servico_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").assumirServico("1")
  end

  def test_assumirServico_true_para_id_servico_inteiro_servico_cadastrado
    servico = Servicos.new(1,1,"Manutenção de um Microondas")
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").assumirServico(servico)
  end

  def test_consultarPedidoOrcamento_false_para_pedido_orcamento_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoOrcamento(1.0)
  end

  def test_consultarPedidoOrcamento_false_para_pedido_orcamento_int
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoOrcamento(1)
  end

  def test_consultarPedidoOrcamento_false_para_pedido_orcamento_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoOrcamento("1")
  end

  def test_consultarPedidoOrcamento_true_para_pedido_inteiro_pedido_orcamento_cadastrado
    pedido_orcamento = PedidoDeOrcamento.new(230.00, 11111111111, 1)
    assert_instance_of PedidoDeOrcamento, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoOrcamento(pedido_orcamento)
  end

  def test_consultarPedidoFornecedor_false_para_pedido_fornecedor_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoFornecedor(1.0)
  end

  def test_consultarPedidoFornecedor_false_para_pedido_fornecedor_int
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoFornecedor(1)
  end

  def test_consultarPedidoFornecedor_false_para_pedido_fornecedor_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoFornecedor("1")
  end

  def test_consultarPedidoFornecedor_true_para_pedido_inteiro_pedido_fornecedor_cadastrado
    pedido_fornecedor = PedidoDeFornecedor.new("08356962000190")
    assert_instance_of PedidoDeFornecedor, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarPedidoFornecedor(pedido_fornecedor)
  end

  def test_consultarServico_false_para_servico_float
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarServico(1.0)
  end

  def test_consultarServico_false_para_servico_inteiro
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarServico(1)
  end

  def test_consultarServico_false_para_servico_string
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarServico("1")
  end

  def test_consultarServico_true_para_servico_cadastrado
    servico = Servicos.new(1,1,"Manutenção de um Microondas")
    assert_instance_of Servicos, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarServico(servico)
  end

  def test_consultarEstoque_nil_para_produtos_nao_cadastrados
    assert_equal [], Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarEstoque()
  end

  def test_consultarEstoque_true_para_retorno_array_hash_produtos
    produto = Produtos.new("Fusível de Vidro", 30, 2.80)
    produto = Produtos.new("Lâmpada de Microondas", 25, 20.00)
    produto = Produtos.new("Capacitor", 10, 10.00)
    produto = Produtos.new("Motor de Batedeira", 15, 50.00)
    assert_instance_of Array, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").consultarEstoque()
  end

  
end