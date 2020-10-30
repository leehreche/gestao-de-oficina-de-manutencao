require 'minitest/autorun'
require_relative '../tipo_de_aparelhos'

class MiniTestTipoDeAparelho < Minitest::Test

  i_suck_and_my_tests_are_order_dependent!

  def test_editarPrazoManutencao_false_para_floats
    assert_equal false, TipoDeAparelhos.new("Microondas", 20).editarPrazoManutencao(10.0)
  end

  def test_editarPrazoManutencao_false_para_strings
    assert_equal false, TipoDeAparelhos.new("Microondas", 20).editarPrazoManutencao("10 dias")
  end

  def test_editarPrazoManutencao_true_para_inteiros
    assert_equal true, TipoDeAparelhos.new("Microondas", 20).editarPrazoManutencao(10)
  end

  def test_consultarTipoAparelho_true_para_retorno_com_uma_instancia_de_tipo_de_aparelho
    assert_instance_of TipoDeAparelhos, TipoDeAparelhos.new("Microondas", 20).consultarTipoAparelho()
  end

end