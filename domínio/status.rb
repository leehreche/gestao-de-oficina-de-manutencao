class Status

  @@idGlobalControle = 0
  @@array_status = []

  def initialize(descricao, quantidade, preco)
    @id = @@idGlobalControle
    @tipoStatus = tipoStatus
    @descricaoStatus = descricaoStatus

    @@idGlobalControle += 1

    novoStatus = {"id" => @id, "tipoStatus" => tipoStatus, "descricaoStatus" => descricaoStatus}
  
    @@array_status << novoStatus
  end

  def consultarStatus()
    @@array_status.map do |status|
      if @id.eql?(tipo_aparelho["id"])
        return status   
      end
    end
    return false
  end

end