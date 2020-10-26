class Clientes

  @@array_clientes = []

  def initialize(cpf, nome, endereco, cidade, estado, telefone)
    @cpf = cpf
    @nome = nome
    @endereco = endereco
    @cidade = cidade
    @estado = estado
    @telefone = telefone

    novoCliente = {"cpf" => cpf, "nome" => nome, "endereco" => endereco, "cidade" => cidade, "estado" => estado, "telefone" => telefone}
  
    @@array_clientes << novoCliente
  end

  def editarEndereco(enderecoNovo)
    if enderecoNovo.kind_of?String
      @endereco = enderecoNovo

      @@array_clientes.map do |cliente|
        if @cpf.eql?(cliente["cpf"])
          cliente["endereco"] = @endereco
          return true      
        end
      end
    end
    return false
  end

  def editarCidade(cidadeNova)
    if cidadeNova.kind_of?String
      @cidade = cidadeNova

      @@array_clientes.map do |cliente|
        if @cpf.eql?(cliente["cpf"])
          cliente["cidade"] = @cidade
          return true      
        end
      end
    end
    return false
  end

  def editarEstado(estadoNovo)
    if estadoNovo.kind_of?String
      @estado = estadoNovo

      @@array_clientes.map do |cliente|
        if @cpf.eql?(cliente["cpf"])
          cliente["estado"] = @estado
          return true      
        end
      end
    end
    return false
  end

  def editarTelefone(telefoneNovo)
    if telefoneNovo.kind_of?String
      @telefone = telefoneNovo
      
      @@array_clientes.map do |cliente|
        if @cpf.eql?(cliente["cpf"])
          cliente["telefone"] = @telefone
          return true      
        end
      end
    end
    return false
  end
end