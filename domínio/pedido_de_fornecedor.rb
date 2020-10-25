require_relative 'fornecedores'

class PedidoDeFornecedor < Pedidos

  def initialize(id_fornecedor)
    @id_fornecedor = id_fornecedor
  end

  def editarFornecedor(fornecedorNovo)
    if fornecedorNovo.kind_of?Integer
      @id_fornecedor = fornecedorNovo
      return true
    end
    return false
  end

  def consultarValorTotal()
    
  end
  
end