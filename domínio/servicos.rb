class Servicos

  @@idGlobalControle = 0
  @@array_servicos = []

  def initialize(id_pedido, id_aparelho, descricaoServico)
    @id = @@idGlobalControle
    @id_funcionario = nil
    @id_pedido = id_pedido
    @id_aparelho = id_aparelho
    @descricaoServico = descricaoServiço
    @statusAndamento = 1

    @@idGlobalControle += 1
    
    novoServico = {"id" => @id, "id_funcionario" => id_funcionario, "id_pedido" => id_pedido, "id_aparelho" => id_aparelho, "descricaoServico" => descricaoServico, "statusAndamento" => statusAndamento}
  
    @@array_servicos << novoServico
  end

  def editarTipoAparelho(tipoAparelhoNovo)
    if tipoAparelhoNovo.kind_of?Integer
      @id_aparelho = tipoAparelhoNovo
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["id_aparelho"] = @id_aparelho
          return true      
        end
      end
    end
    return false
  end

  def editarPedidoOrcamento(pedidoOrcamentoNovo)
    if pedidoOrcamentoNovo.kind_of?Integer
      @id_pedido = pedidoOrcamentoNovo
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["id_pedido"] = @id_pedido
          return true      
        end
      end
    end
    return false
  end

  def adicionarFuncionario(funcionarioNovo)
    if funcionarioNovo.kind_of?Integer
      @id_funcionario = funcionarioNovo
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["id_funcionario"] = @id_funcionario
          return true      
        end
      end
    end
    return false
  end

  def editarFuncionario(funcionarioNovo)
    if funcionarioNovo.kind_of?Integer
      @id_funcionario = funcionarioNovo
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["id_funcionario"] = @id_funcionario
          return true      
        end
      end
    end
    return false
  end

  def editarDescricao(descricaoNova)
    if descricaoNova.kind_of?String
      @descricaoServico = descricaoNova
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["descricaoServico"] = @descricaoServico
          return true      
        end
      end
    end
    return false
  end

  def editarStatusAndamento(statusAndamentoNovo)
    if statusAndamentoNovo.kind_of?Integer
      @statusAndamento = statusAndamentoNovo
      
      @@array_servicos.map do |servico|
        if @id.eql?(servico["id"])
          servico["statusAndamento"] = @statusAndamento
          return true      
        end
      end
    end
    return false
  end

  def consultarStatusServico()
    @@array_servicos.map do |servico|
      if @id.eql?(servico["id"])
        return servico["statusAndamento"]   
      end
    end
    return false
  end

  def consultarServico()
    @@array_servicos.map do |servico|
      if @id.eql?(servico["id"])
        return servico   
      end
    end
    return false
  end
end