class Status

  @@idGlobalControle = 1
  @@array_status = []

  def initialize(tipoStatus, descricaoStatus)
    @id = @@idGlobalControle
    @tipoStatus = tipoStatus
    @descricaoStatus = descricaoStatus

    @@idGlobalControle += 1

    novoStatus = {"id" => @id, "tipoStatus" => tipoStatus, "descricaoStatus" => descricaoStatus}
  
    @@array_status << novoStatus
  end

  def consultarStatus()
    return self
  end

end