require_relative 'itens_do_pedido'
require_relative 'produtos'

class Pedidos

  def initialize(id)
    @id = id
    @data = Time.now
  end

  def adicionarProduto(id_produto, quantidade)

    if !id_produto.kind_of?Integer
      puts "\nDados do Produto não é compatível"
      return false 
    end
    
    if !quantidade.kind_of?Integer
      puts "\nValor da quantidade não é compatível"
      return false 
    end

    item = ItensDoPedido.new(id_produto, @id, quantidade)
    puts "\nItens do Pedido criado com sucesso"
    return true    

  end

  def editarProduto(id_produto, quantidade)

    if !id_produto.kind_of?Integer
      puts "\nDados do Produto não é compatível"
      return false 
    end
    
    if !quantidade.kind_of?Integer
      puts "\nValor da quantidade não é compatível"
      return false 
    end

    ItensDoPedido.class_variable_get(:@@array_itens_do_pedido).map do |item|
      if @id.eql?(item["id_pedido"]) && id_produto.eql?(item["id_produto"])
        item["quantidade"] = quantidade
        return true      
      end
    end
    return false
  end

  def retirarProduto(id_produto)

    if !id_produto.kind_of?Integer
      puts "Dados do Produto não é compatível"
      return false 
    end

    indice = 0

    ItensDoPedido.class_variable_get(:@@array_itens_do_pedido).map do |item|
      if @id.eql?(item["id_pedido"])
        if id_produto.eql?(item["id_produto"])
          ItensDoPedido.class_variable_get(:@@array_itens_do_pedido).slice!(indice)
          return true   
        end   
      end
      indice += 1 
    end
    return false

  end

  def emitirRecibo(id = nil)

    if id == nil
      id_pedido = @id
    elsif
      id_pedido = id
    end

    accept = 0

    ItensDoPedido.class_variable_get(:@@array_itens_do_pedido).map do |item|
      if id_pedido.eql?(item["id_pedido"])
        Produtos.class_variable_get(:@@array_produtos).map do |produto|
          if item["id_produto"].eql?(produto["id"])
            puts "\n\nProduto: #{produto["descricao"]}"
            puts "\nQuantidade: #{item["quantidade"]}"
            puts "\nPreço: #{produto["preco"]}"      
          end
        end        
        accept += 1      
      end 
    end
    return true if accept > 0
    return false
  end

  def consultarPedido()
    return self
  end 
  
  def consultarValorTotal()
    valorTotal = 0

    ItensDoPedido.class_variable_get(:@@array_itens_do_pedido).map do |item|
      if @id.eql?(item["id_pedido"])
        Produtos.class_variable_get(:@@array_produtos).map do |produto|
          if item["id_produto"].eql?(produto["id"])
            valorTotal += item["quantidade"] * produto["preco"]      
          end
        end             
      end 
    end
    return valorTotal
  end
end