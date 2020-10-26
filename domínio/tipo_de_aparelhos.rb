class TipoDeAparelhos

  @@idGlobalControle = 0
  @@array_tipo_aparelhos = []

  def initialize(nome, prazo_manutencao)
    @id = @@idGlobalControle
    @nome = nome
    @prazo_manutencao = prazo_manutencao

    @@idGlobalControle += 1

    novoTipoAparelho = {"id" => @id, "nome" => nome, "prazo_manutencao" => prazo_manutencao}
  
    @@array_tipo_aparelhos << novoTipoAparelho
  end

  def editarPrazoManutencao(prazoManutencaoNovo)
    if prazoManutencaoNovo.kind_of?Integer
      @prazo_manutencao = prazoManutencaoNovo
      
      @@array_tipo_aparelhos.map do |tipo_aparelho|
        if @id.eql?(tipo_aparelho["id"])
          tipo_aparelho["prazo_manutencao"] = @prazo_manutencao
          return true      
        end
      end
    end
    return false
  end

  def consultarTipoAparelho()
    @@array_tipo_aparelhos.map do |tipo_aparelho|
      if @id.eql?(tipo_aparelho["id"])
        return tipo_aparelho      
      end
    end
    return false
  end  
end