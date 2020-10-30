require_relative 'fornecedores'
require_relative 'pedidos'

class PedidoDeFornecedor < Pedidos

  @@idGlobalControle = 0
  @@array_pedido_fornecedor = []

  def initialize(id_fornecedor)
    super(@@idGlobalControle)
    @id_fornecedor = id_fornecedor

    @@idGlobalControle += 1

    novoPedidoFornecedor = {"id" => @id, "data" => @data, "id_fornecedor" => id_fornecedor}
  
    @@array_pedido_fornecedor << novoPedidoFornecedor
  end

  def editarFornecedor(fornecedorNovo)
    if fornecedorNovo.kind_of?String
      @id_fornecedor = fornecedorNovo
      
      @@array_pedido_fornecedor.map do |pedido|
        if @id.eql?(pedido["id"])
          pedido["id_fornecedor"] = @id_fornecedor
          return true      
        end
      end
    end
    return false
  end

  def emitirRecibo()    
    puts "Imprimindo Recibo de Pedido de Fornecedor"
    
    Fornecedores.class_variable_get(:@@array_fornecedores).map do |fornecedor|
      if @id_fornecedor.eql?(fornecedor["cnpj"])
        puts "\n\nFornecedor: #{fornecedor["razao_social"]}"      
      end
    end

    puts "\n\n Listagem de Produtos:"
    super(@id)
  end

  def consultarPedido()
    pedido = super
    return self
  end 
  
  def consultarValorTotal()
    return super    
  end
  
end