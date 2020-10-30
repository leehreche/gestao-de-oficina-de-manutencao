require 'minitest/autorun'
require_relative '../servicos'

class MiniTestServicos < Minitest::Test

  status = Status.new(1,"Pendente")
  status = Status.new(2,"Em execução")

  def test_editarTipoAparelho_false_para_floats
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarTipoAparelho(1.0)
  end

  def test_editarTipoAparelho_false_para_strings
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarTipoAparelho("1.0")
  end

  def test_editarTipoAparelho_true_para_inteiros
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").editarTipoAparelho(1)
  end

  def test_editarPedidoOrcamento_false_para_floats
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarPedidoOrcamento(1.0)
  end

  def test_editarPedidoOrcamento_false_para_strings
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarPedidoOrcamento("1.0")
  end

  def test_editarPedidoOrcamento_true_para_inteiros
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").editarPedidoOrcamento(1)
  end

  def test_adicionarFuncionario_false_para_floats
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").adicionarFuncionario(1.0)
  end

  def test_adicionarFuncionario_false_para_strings
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").adicionarFuncionario("1.0")
  end

  def test_adicionarFuncionario_true_para_inteiros
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").adicionarFuncionario(1)
  end

  def test_editarFuncionario_false_para_floats
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarFuncionario(1.0)
  end

  def test_editarFuncionario_false_para_strings
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarFuncionario("1.0")
  end

  def test_editarFuncionario_true_para_inteiros
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").editarFuncionario(1)
  end

  def test_editarDescricao_false_para_inteiros
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarDescricao(123)
  end

  def test_editarDescricao_true_para_strings
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").editarDescricao("Manutenção em um Microondas que apresenta falhas nos leds")
  end

  def test_editarStatusAndamento_false_para_strings
    assert_equal false, Servicos.new(1,1,"Manutenção de um Microondas").editarStatusAndamento("2")
  end

  def test_editarStatusAndamento_true_para_inteiros
    assert_equal true, Servicos.new(1,1,"Manutenção de um Microondas").editarStatusAndamento(2)
  end

  def test_consultarStatusServico_true_para_strings
    assert_instance_of String, Servicos.new(1,1,"Manutenção de um Microondas").consultarStatusServico()
  end

  def test_consultarServico_true_para_uma_instancia_de_servico
    assert_instance_of Servicos, Servicos.new(1,1,"Manutenção de um Microondas").consultarServico()
  end

  
end