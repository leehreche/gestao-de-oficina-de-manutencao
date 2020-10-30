class Produtos

  @@idGlobalControle = 0
  @@array_produtos = []

  def initialize(descricao, quantidade, preco)
    @id = @@idGlobalControle
    @descricao = descricao
    @quantidade = quantidade
    @preco = preco

    @@idGlobalControle += 1

    novoProduto = {"id" => @id, "descricao" => descricao, "quantidade" => quantidade, "preco" => preco}
  
    @@array_produtos << novoProduto
  end

  def cadastrarEntradaProduto(quantidade)
    if quantidade.kind_of?Integer
      @quantidade += quantidade
      
      @@array_produtos.map do |produto|
        if @id.eql?(produto["id"])
          produto["quantidade"] = @quantidade
          return true      
        end
      end
      puts "Produto não encontrado"
        return false
    end
    puts "Quantidade não compatível"
    return false
  end

  def cadastrarSaidaProduto(quantidade)
    if quantidade.kind_of?Integer
      if @quantidade >= quantidade
        @quantidade -= quantidade
      
        @@array_produtos.map do |produto|
          if @id.eql?(produto["id"])
            produto["quantidade"] = @quantidade
            return true      
          end
        end
        puts "Produto não encontrado"
        return false
      else
        puts "Quantidade que deseja tirar é menor que a quantidade cadastrada no estoque"
        return false
      end
    end
    puts "Quantidade não compatível"
    return false
  end

  def editarDescricaoProduto(descricaoProdutoNovo)
    if descricaoProdutoNovo.kind_of?String
      @descricao = descricaoProdutoNovo
      
      @@array_produtos.map do |produto|
        if @id.eql?(produto["id"])
          produto["descricao"] = @descricao
          return true      
        end
      end
    end
    return false
  end

  def editarPrecoProduto(precoNovo)
    if precoNovo.kind_of?Float
      @preco = precoNovo
      
      @@array_produtos.map do |produto|
        if @id.eql?(produto["id"])
          produto["preco"] = @preco
          return true      
        end
      end
    end
    return false
  end

  def consultarProduto()
    return self
  end 
end