require 'minitest/autorun'
require_relative '../clientes'

class MiniTestClientes < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_editarEndereco_false_para_inteiros
    assert_equal false, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarEndereco(123)
  end

  def test_editarEndereco_true_para_strings
    assert_equal true, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarEndereco("Avenida João Pinheiro, 656")
  end

  def test_editarCidade_false_para_inteiros
    assert_equal false, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarCidade(123)
  end

  def test_editarCidade_true_para_strings
    assert_equal true, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarCidade("Santa Cruz das Palmeiras")
  end

  def test_editarEstado_false_para_inteiros
    assert_equal false, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarEstado(123)
  end

  def test_editarEstado_true_para_strings
    assert_equal true, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarEstado("SP")
  end

  def test_editarTelefone_false_para_inteiros
    assert_equal false, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarTelefone(3537213456)
  end

  def test_editarTelefone_true_para_strings
    assert_equal true, Clientes.new(11111111111, "Letícia", "Rua Machado, 24, Centro", "Poços de Caldas", "MG", "(35)99999-9999").editarTelefone("(35)2727-2727")
  end
end