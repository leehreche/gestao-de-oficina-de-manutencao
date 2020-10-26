class ItensDoPedido

  @@array_itens_do_pedido = []

  def initialize(id_produto, id_pedido, quantidade)
    @id_produto = id_produto
    @id_pedido = id_pedido
    @quantidade = quantidade

    novoItemDoPedido = {"id_produto" => id_produto, "id_pedido" => id_pedido, "quantidade" => quantidade}
  
    @@array_itens_do_pedido << novoItemDoPedido
  end

  def alterarQuantidadeProduto(quantidadeNova)
    if quantidadeNova.kind_of?Integer
      @quantidade = quantidadeNova
      
      @@array_itens_do_pedido.map do |item|
        if @id_pedido.eql?(item["id_pedido"]) && @id_produto.eql?(item["id_produto"])
          item["quantidade"] = @quantidade
          return true      
        end
      end
    end
    return false
  end
end