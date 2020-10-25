class TipoDeAparelhos

  def initialize(id, nome, prazo_manutencao)
    @id = id
    @nome = nome
    @prazo_manutencao = prazo_manutencao
  end

  def editarPrazoManutencao(prazoManutencaoNovo)
    if prazoManutencaoNovo.kind_of?Integer
      @prazo_manutencao = prazoManutencaoNovo
      return true
    end
    return false
  end

  def consultarTipoAparelho()

  end  
end