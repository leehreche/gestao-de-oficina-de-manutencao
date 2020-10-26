class Fornecedores

  @@array_fornecedores = []

  def initialize(cnpj, razao_social, nome_fantasia, endereco, cidade, estado, telefone)
    @cnpj = cnpj
    @razao_social = razao_social
    @nome_fantasia = nome_fantasia
    @endereco = endereco
    @cidade = cidade
    @estado = estado
    @telefone = telefone

    novoFornecedor = {"cnpj" => cnpj, "razao_social" => razao_social, "nome_fantasia" => nome_fantasia, "endereco" => endereco, "cidade" => cidade, "estado" => estado, "telefone" => telefone}
  
    @@array_fornecedores << novoFornecedor
  end
  
  def editarEndereco(enderecoNovo)
    if enderecoNovo.kind_of?String
      @endereco = enderecoNovo

      @@array_fornecedores.map do |fornecedor|
        if @cnpj.eql?(fornecedor["cnpj"])
          fornecedor["endereco"] = @endereco
          return true      
        end
      end
    end
    return false 
  end

  def editarCidade(cidadeNova)
    if cidadeNova.kind_of?String
      @cidade = cidadeNova
      
      @@array_fornecedores.map do |fornecedor|
        if @cnpj.eql?(fornecedor["cnpj"])
          fornecedor["cidade"] = @cidade
          return true      
        end
      end
    end
    return false
  end

  def editarEstado(estadoNovo)
    if estadoNovo.kind_of?String
      @estado = estadoNovo
      
      @@array_fornecedores.map do |fornecedor|
        if @cnpj.eql?(fornecedor["cnpj"])
          fornecedor["estado"] = @estado
          return true      
        end
      end
    end
    return false
  end

  def editarTelefone(telefoneNovo)
    if telefoneNovo.kind_of?String
      @telefone = telefoneNovo
      
      @@array_fornecedores.map do |fornecedor|
        if @cnpj.eql?(fornecedor["cnpj"])
          fornecedor["telefone"] = @telefone
          return true      
        end
      end
    end
    return false
  end
end