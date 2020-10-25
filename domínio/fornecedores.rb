class Fornecedores

  def initialize(cnpj, razao_social, nome_fantasia, endereco, cidade, estado, telefone)
    @cnpj = cnpj
    @razao_social = razao_social
    @nome_fantasia = nome_fantasia
    @endereco = endereco
    @cidade = cidade
    @estado = estado
    @telefone = telefone
  end
  
  def editarEndereco(enderecoNovo)
    if enderecoNovo.kind_of?String
      @endereco = enderecoNovo
      return true
    end
    return false 
  end

  def editarCidade(cidadeNova)
    if cidadeNova.kind_of?String
      @cidade = cidadeNova
      return true
    end
    return false
  end

  def editarEstado(estadoNovo)
    if estadoNovo.kind_of?String
      @estado = estadoNovo
      return true
    end
    return false
  end

  def editarTelefone(telefoneNovo)
    if telefoneNovo.kind_of?String
      @telefone = telefoneNovo
      return true
    end
    return false
  end
end