require_relative 'fornecedores'

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
    if fornecedorNovo.kind_of?Integer
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

  def consultarValorTotal()
    puts "Imprimindo Recibo de Pedido de Orçamento"
    
    Fornecedores.@@array_fornecedores.map do |fornecedor|
      if @id_fornecedor.eql?(fornecedor["cnpj"])
        puts "\n\nFornecedor: #{fornecedor["razao_social"]}"      
      end
    end

    puts "\n\n Listagem de Produtos:"
    
    super
  end
  
end