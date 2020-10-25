class ItensDoPedido

  def initialize(id_produto, id_pedido, quantidade)
    @id_produto = id_produto
    @id_pedido = id_pedido
    @quantidade = quantidade
  end

  def alterarQuantidadeProduto(quantidadeNova)
    if quantidadeNova.kind_of?Integer
      @cargo = quantidadeNova
      return true
    end
    return false
  end
end