class Servicos

  def initialize(id, descricao, quantidade, preco)
    @id = id
    @id_funcionario = null
    @id_pedido = id_pedido
    @id_aparelho = id_aparelho
    @descricaoServico = descricaoServiço
    @statusAndamento = 1
  end

  def editarTipoAparelho(tipoAparelhoNovo)
    if tipoAparelhoNovo.kind_of?Integer
      @id_aparelho = tipoAparelhoNovo
      return true
    end
    return false
  end

  def editarPedidoOrcamento(pedidoOrcamentoNovo)
    if pedidoOrcamentoNovo.kind_of?Integer
      @id_pedido = pedidoOrcamentoNovo
      return true
    end
    return false
  end

  def adicionarFuncionario(funcionarioNovo)
    if funcionarioNovo.kind_of?Integer
      @id_funcionario = funcionarioNovo
      return true
    end
    return false
  end

  def editarFuncionario(funcionarioNovo)
    if funcionarioNovo.kind_of?Integer
      @id_funcionario = funcionarioNovo
      return true
    end
    return false
  end

  def editarDescricao(descricaoNova)
    if descricaoNova.kind_of?String
      @descricaoServico = descricaoNova
      return true
    end
    return false
  end

  def editarStatusAndamento(statusAndamentoNovo)
    if statusAndamentoNovo.kind_of?Integer
      @statusAndamento = statusAndamentoNovo
      return true
    end
    return false
  end

  def consultarStatusServico()

  end

  def consultarServico()

  end
end