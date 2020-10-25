class Produtos

  def initialize(id, descricao, quantidade, preco)
    @id = id
    @descricao = descricao
    @quantidade = quantidade
    @preco = preco
  end

  def cadastrarEntradaProduto()

  end

  def cadastrarSaidaProduto()

  end

  def editarDescricaoProduto(descricaoProdutoNovo)
    if descricaoProdutoNovo.kind_of?String
      @descricao = descricaoProdutoNovo
      return true
    end
    return false
  end

  def editarPrecoProduto(precoNovo)
    if precoNovo.kind_of?Float
      @preco = precoNovo
      return true
    end
    return false
  end

  def consultarProduto()
    
  end 
end