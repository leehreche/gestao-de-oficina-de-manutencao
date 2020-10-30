require 'minitest/autorun'
require_relative '../status'

class MiniTestStatus < Minitest::Test
  def test_consultarStatus_true_para_retorno_com_uma_instancia_de_status
    assert_instance_of Status, Status.new(1, "Pendente de Aprovação").consultarStatus()
  end
end