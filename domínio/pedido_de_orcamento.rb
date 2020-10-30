require_relative 'clientes'
require_relative 'pedidos'
require_relative 'tipo_de_aparelhos'
require_relative 'status'

class PedidoDeOrcamento < Pedidos

  @@idGlobalControle = 0
  @@array_pedido_orcamento = []

  def initialize(valorMaoDeObra, id_cliente, id_aparelho)
    super(@@idGlobalControle)
    @valorMaoDeObra = valorMaoDeObra
    @id_cliente = id_cliente
    @id_aparelho = id_aparelho
    @statusAutorizacao = 1

    @@idGlobalControle += 1

    novoPedidoOrcamento = {"id" => @id, "data" => @data, "id_cliente" => id_cliente, "id_aparelho" => id_aparelho, "statusAutorizacao" => @statusAutorizacao, "valorMaoDeObra" => valorMaoDeObra}
  
    @@array_pedido_orcamento << novoPedidoOrcamento
  end

  def editarTipoAparelho(tipoAparelhoNovo)
    if tipoAparelhoNovo.kind_of?Integer
      @id_aparelho = tipoAparelhoNovo

      @@array_pedido_orcamento.map do |pedido|
        if @id.eql?(pedido["id"])
          pedido["id_aparelho"] = @id_aparelho
          return true      
        end
      end
    end
    return false
  end

  def editarCliente(clienteNovo)
    if clienteNovo.kind_of?Integer
      @id_cliente = clienteNovo
      
      @@array_pedido_orcamento.map do |pedido|
        if @id.eql?(pedido["id"])
          pedido["id_cliente"] = @id_cliente
          return true      
        end
      end
    end
    return false
  end

  def editarValorMaoDeObra(valorMaoDeObraNovo)
    if valorMaoDeObraNovo.kind_of?Float
      @valorMaoDeObra = valorMaoDeObraNovo

      @@array_pedido_orcamento.map do |pedido|
        if @id.eql?(pedido["id"])
          pedido["valorMaoDeObra"] = @valorMaoDeObra
          return true      
        end
      end
    end
    return false
  end

  def editarStatusAutorizacao(statusAutorizacaoNovo)
    if statusAutorizacaoNovo.kind_of?Integer
      @statusAutorizacao = statusAutorizacaoNovo
      
      @@array_pedido_orcamento.map do |pedido|
        if @id.eql?(pedido["id"])
          pedido["statusAutorizacao"] = @statusAutorizacao
          return true      
        end
      end
    end
    return false
  end

  def consultarStatusAutorizacao()
    @@array_pedido_orcamento.map do |pedido|
      if @id.eql?(pedido["id"])
        Status.class_variable_get(:@@array_status).map do |status|
          if status["id"].eql?(pedido["statusAutorizacao"])
            return status["descricaoStatus"]   
          end
        end    
      end
    end
    return false
  end 
  
  def emitirRecibo()
    puts "Imprimindo Recibo de Pedido de Orçamento"
    
    Clientes.class_variable_get(:@@array_clientes).map do |cliente|
      if @id_cliente.eql?(cliente["cpf"])
        puts "\n\nCliente: #{cliente["nome"]}"      
      end
    end

    puts "\n\n Listagem de Produtos:"
    
    retorno = super(@id)

    puts "\n\nValor da Mão de Obra: #{@valorMaoDeObra}"

    TipoDeAparelhos.class_variable_get(:@@array_tipo_aparelhos).map do |tipo_aparelho|
      if @id_aparelho.eql?(tipo_aparelho["id"])
        puts "\n\nTipo do Aparelho: #{tipo_aparelho["nome"]}"
      end
    end

    retorno
  end

  def consultarPedido()
    pedido = super
    return self
  end 
  
  def consultarValorTotal()
    valorTotal = super
    valorTotal += @valorMaoDeObra
    return valorTotal    
  end
end