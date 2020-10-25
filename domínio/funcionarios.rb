class Funcionarios

  def initialize(cpf, nome, cargo)
    @cpf = cpf
    @nome = nome
    @cargo = cargo
  end

  def editarCargo(cargoNovo)
    if cargoNovo.kind_of?String
      @cargo = cargoNovo
      return true
    end
    return false
  end

  def realizarPedidoOrcamento()

  end

  def realizarPedidoFornecedor()

  end

  def realizarCadastroFornecedor()

  end

  def realizarCadastroCliente()

  end

  def realizarCadastroProduto()

  end

  def realizarBaixaEstoqueProduto()

  end

  def realizarCadastroTipoAparelho()

  end

  def realizarCadastroServico()

  end

  def realizarEmissaoRecibo()

  end

  def assumirServico()

  end

  def consultarPedidoOrcamento()

  end

  def consultarPedidoFornecedor()

  end

  def consultarServico()

  end

  def consultarEstoque()

  end
end