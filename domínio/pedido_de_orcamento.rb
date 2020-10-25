class PedidoDeOrcamento < Pedidos

  def initialize(id_funcionario, id_cliente, id_aparelho)
    @valorMaoDeObra = valorMaoDeObra
    @id_cliente = id_cliente
    @id_aparelho = id_aparelho
    @statusAutorizacao = 1
  end

  def editarTipoAparelho(tipoAparelhoNovo)
    if tipoAparelhoNovo.kind_of?Integer
      @id_aparelho = tipoAparelhoNovo
      return true
    end
    return false
  end

  def editarCliente(clienteNovo)
    if clienteNovo.kind_of?Integer
      @id_aparelho = clienteNovo
      return true
    end
    return false
  end

  def editarValorMaoDeObra(valorMaoDeObraNovo)
    if valorMaoDeObraNovo.kind_of?Float
      @valorMaoDeObra = valorMaoDeObraNovo
      return true
    end
    return false
  end

  def editarStatusAutorizacao(statusAutorizacaoNovo)
    if statusAutorizacaoNovo.kind_of?Integer
      @statusAutorizacao = statusAutorizacaoNovo
      return true
    end
    return false
  end

  def consultarStatusAutorizacao()
    
  end 
  
  def consultarValorTotal()

  end
end