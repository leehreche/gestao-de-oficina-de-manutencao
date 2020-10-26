require_relative 'pedido_de_fornecedor'
require_relative 'pedido_de_orcamento'
require_relative 'produtos'
require_relative 'clientes'
require_relative 'fornecedor'
require_relative 'tipo_de_aparelhos'
require_relative 'servicos'

@@array_funcionarios = []

class Funcionarios

  def initialize(cpf, nome, cargo)
    @cpf = cpf
    @nome = nome
    @cargo = cargo

    novoFuncionario = {"cpf" => cpf, "nome" => nome, "cargo" => cargo}
  
    @@array_funcionarios << novoFuncionario
  end

  def editarCargo(cargoNovo)
    if cargoNovo.kind_of?String
      @cargo = cargoNovo
      
      @@array_funcionarios.map do |funcionario|
        if @cpf.eql?(funcionario["cpf"])
          funcionario["cargo"] = @cargo
          return true      
        end
      end      
    end
    return false
  end

  def realizarPedidoOrcamento(cliente, aparelho, maoDeObra)
        
    if !cliente.kind_of?Integer
      puts "Dados do Cliente não é compatível"
      return false 
    end
    
    if !aparelho.kind_of?Integer
      puts "Dados do Aparelho não é compatível"
      return false 
    end
    
    if !maoDeObra.kind_of?Float
      puts "Valor da mão de obra não é válido"
      return false 
    end

    pedidoOrcamento = PedidoDeOrcamento.new(maoDeObra, cliente, aparelho)
    puts "Pedido de Orçamento criado com sucesso"
    return true    

  end

  def realizarPedidoFornecedor(fornecedor)

    if !fornecedor.kind_of?Integer
      puts "Dados do Fornecedor não é compatível"
      return false 
    end

    pedidoFornecedor = PedidoDeFornecedor.new(fornecedor)
    puts "Pedido de Fornecedor criado com sucesso"
    return true

  end

  def realizarCadastroFornecedor(cnpj, razao_social, nome_fantasia, endereco, cidade, estado, telefone)

    if !cnpj.kind_of?Integer
      puts "CNPJ não é compatível"
      return false 
    end
    
    if !razao_social.kind_of?String
      puts "Dados da Razão Social não é compatível"
      return false 
    end
    
    if !nome_fantasia.kind_of?String
      puts "Dados do Nome Fantasia não é válido"
      return false 
    end

    if !endereco.kind_of?String
      puts "Dados do Endereço não é compatível"
      return false 
    end
    
    if !cidade.kind_of?String
      puts "Dados da Cidade não é compatível"
      return false 
    end
    
    if !estado.kind_of?String
      puts "Dados do Estado não é válido"
      return false 
    end

    if !telefone.kind_of?String
      puts "Dados do Telefone não é válido"
      return false 
    end

    fornecedor = Fornecedores.new(cnpj, razao_social, nome_fantasia, endereco, cidade, estado, telefone)
    puts "Fornecedor criado com sucesso"
    return true

  end

  def realizarCadastroCliente(cpf, nome, endereco, cidade, estado, telefone)

    if !cpf.kind_of?Integer
      puts "CPF não é compatível"
      return false 
    end
    
    if !nome.kind_of?String
      puts "Dados do Nome não é compatível"
      return false 
    end

    if !endereco.kind_of?String
      puts "Dados do Endereço não é compatível"
      return false 
    end
    
    if !cidade.kind_of?String
      puts "Dados da Cidade não é compatível"
      return false 
    end
    
    if !estado.kind_of?String
      puts "Dados do Estado não é válido"
      return false 
    end

    if !telefone.kind_of?String
      puts "Dados do Telefone não é válido"
      return false 
    end

    cliente = Clientes.new(cpf, nome, endereco, cidade, estado, telefone)
    puts "Cliente criado com sucesso"
    return true

  end

  def realizarCadastroProduto(descricao, quantidade, preco)

    if !descricao.kind_of?String
      puts "Dados da Descrição não é compatível"
      return false 
    end
    
    if !quantidade.kind_of?Integer
      puts "Valor da quantidade não é válido"
      return false 
    end

    if !preco.kind_of?Float
      puts "Valor do preço não é válido"
      return false 
    end

    produto = Produtos.new(descricao, quantidade, preco)
    puts "Produto criado com sucesso"
    return true

  end

  def realizarBaixaEstoqueProduto(id_produto, quantidade)

    if !id_produto.kind_of?Integer
      puts "Dados do Produto não é válido"
      return false 
    end

    if !quantidade.kind_of?Float
      puts "Valor da quantidade não é válido"
      return false 
    end

    Produtos.@@array_produtos.map do |produto|
      if id_produto.eql?(produto["id"])
        retorno = produto.cadastrarSaidaProduto(quantidade) 
        return retorno
      end
    end
    puts "Produto não encontrado"
    return false
  end

  def realizarCadastroTipoAparelho(nome, prazo_manutencao)

    if !nome.kind_of?String
      puts "Dados do Nome não é compatível"
      return false 
    end
    
    if !prazo_manutencao.kind_of?Integer
      puts "Dados do Prazo de Manutenção não é válido"
      return false 
    end

    tipoAparelho = TipoDeAparelhos.new(nome, prazo_manutencao)
    puts "Tipo de Aparelho criado com sucesso"
    return true

  end

  def realizarCadastroServico(pedido, aparelho, descricaoServico)

    if !pedido.kind_of?Integer
      puts "Dados do Pedido não é compatível"
      return false 
    end
    
    if !aparelho.kind_of?Integer
      puts "Dados do Aparelho não é válido"
      return false 
    end

    if !descricaoServico.kind_of?Integer
      puts "Dados da  Descrição não é válido"
      return false 
    end

    servico = Servicos.new(pedido, aparelho, descricaoServico)
    puts "Serviço criado com sucesso"
    return true

  end

  def realizarEmissaoRecibo(id, tipo)

    if !id.kind_of?Integer
      puts "Dados da identificação não é válido"
      return false 
    end

    if !tipo.kind_of?String
      puts "Dados do Tipo de Emissão de Recibo não é válido"
      return false 
    end

    if tipo.upcase.eql?("CLIENTE")
      PedidoDeOrcamento.@@array_pedido_orcamento.map do |pedido|
        if id.eql?(pedido["id"])
          retorno = pedido.emitirRecibo()
          return retorno      
        end
      end

      puts "Pedido não encontrado para esse tipo"
      return retorno
    end

    if tipo.upcase.eql?("FORNECEDOR")
      PedidoDeFornecedor.@@array_pedido_fornecedor.map do |pedido|
        if id.eql?(pedido["id"])
          retorno = pedido.emitirRecibo()
          return retorno      
        end
      end

      puts "Pedido não encontrado para esse tipo"
      return retorno
    end

  end

  def assumirServico(id_servico)

    if !id_servico.kind_of?Integer
      puts "Dados da identificação não é válido"
      return false 
    end

    Servicos.@@array_servicos.map do |servico|
      if id_servico.eql?(servico["id"])
        retorno = servico.adicionarFuncionario(@cpf) if servico["id_funcionario"] == nil  
        retorno = servico.editarFuncionario(@cpf) if servico["id_funcionario"] != nil
        return retorno  
      end
    end
    puts "Serviço não encontrado"
    return false
  end

  def consultarPedidoOrcamento(id_pedido_orcamento)

    if !id_pedido_orcamento.kind_of?Integer
      puts "Dados da identificação não é válido"
      return false 
    end

    PedidoDeOrcamento.@@array_pedido_orcamento.map do |pedido|
      if id_pedido_orcamento.eql?(pedido["id"])
        return pedido      
      end
    end

    puts "Pedido não encontrado"
    return false
  end

  def consultarPedidoFornecedor(id_pedido_fornecedor)

    if !id_pedido_fornecedor.kind_of?Integer
      puts "Dados da identificação não é válido"
      return false 
    end

    PedidoDeFornecedor.@@array_pedido_fornecedor.map do |pedido|
      if id_pedido_fornecedor.eql?(pedido["id"])
        return pedido      
      end
    end

    puts "Pedido não encontrado"
    return false
  end

  def consultarServico(id_servico)

    if !id_servico.kind_of?Integer
      puts "Dados da identificação não é válido"
      return false 
    end

    Servicos.@@array_servicos.map do |servico|
      if id_servico.eql?(servico["id"])
        return servico.consultarServico()  
      end
    end
    puts "Serviço não encontrado"
    return false

  end

  def consultarEstoque()
    Produtos.@@array_produtos.map do |produto|
      puts "\n\nProduto: #{produto["descricao"]}"
      puts "\nQuantidade: #{item["quantidade"]}"
      puts "\nPreço: #{produto["preco"]}"
    end 
    return Produtos.@@array_produtos
  end  
end