require 'minitest/autorun'
require_relative '../fornecedores'

class MiniTestFornecedores < Minitest::Test
  def test_editarEndereco_false_para_inteiros
    assert_equal false, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarEndereco(123)
  end

  def test_editarEndereco_true_para_strings
    assert_equal true, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarEndereco("Rua Sete, 345 - Distrito Industrial")
  end

  def test_editarCidade_false_para_inteiros
    assert_equal false, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarCidade(123)
  end

  def test_editarCidade_true_para_strings
    assert_equal true, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarCidade("Brasília")
  end

  def test_editarEstado_false_para_inteiros
    assert_equal false, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarEstado(123)
  end

  def test_editarEstado_true_para_strings
    assert_equal true, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarEstado("DF")
  end

  def test_editarTelefone_false_para_inteiros
    assert_equal false, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarTelefone(123)
  end

  def test_editarTelefone_true_para_strings
    assert_equal true, Fornecedores.new("08356962000190", "Eco GA Ambiental LTDA", "Eco GA", "R. Antônio Togni, 3437 - Vila Cruz", "Poços de Caldas", "MG", "(35)3714-3069").editarTelefone("(35)98888-8888")
  end
end