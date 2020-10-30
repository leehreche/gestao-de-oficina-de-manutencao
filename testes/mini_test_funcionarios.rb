require 'minitest/autorun'
require_relative '../funcionarios'

class MiniTestFuncionarios < Minitest::Test
  def test_editarCargo_false_para_inteiros
    assert_equal false, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").editarCargo(123)
  end

  def test_editarCargo_true_para_strings
    assert_equal true, Funcionarios.new(11111111111, "João", "Administrador de Sistemas Sênior").editarCargo("Hacker")
  end

  
end