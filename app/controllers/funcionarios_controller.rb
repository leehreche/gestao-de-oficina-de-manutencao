class FuncionariosController < ApplicationController
    def index
        @funcionarios = Funcionario.all
    end

    def show
        @funcionario = Funcionario.find(params[:id])
    end

    def new
        @funcionario = Funcionario.new
    end

    def create
        @funcionario = Funcionario.new(funcionario_params)

        if @funcionario.valid?
            @funcionario.save
            redirect_to @funcionario
        else
            flash.now[:notice] = "É necessário preencher todos os campos. O CPF deve conter 11 dígitos (somente números)."
            render :new
        end
    end

    def edit
        @funcionario = Funcionario.find(params[:id])
    end

    def update
        @funcionario = Funcionario.find(params[:id])
        @funcionario.update(funcionario_params)
        redirect_to @funcionario
    end

    def destroy
        @funcionario = Funcionario.find(params[:id])
        if excluir_funcionario(@funcionario)
            @funcionario.destroy
            redirect_to funcionarios_path
        else
            flash[:notice] = "Não é possível excluir o funcionário #{@funcionario.nome}. Há dependências."
            redirect_to funcionarios_path
        end
    end

    private
    def funcionario_params
        params.require(:funcionario).permit(:cpf, :nome, :cargo)
    end

    private 
    def excluir_funcionario(funcionario)
        @contagem = 0
        @servicos = Servico.where(funcionario_cadastro_id: funcionario.id)
        if @servicos.empty?
            @contagem += 1
        end

        @pedido_suppliers = PedidoSupplier.where(id_fornecedor: funcionario.id)
        if @pedido_suppliers.empty?
            @contagem += 1
        end

        @pedido_orcamentos = PedidoOrcamento.where(id_funcionario: funcionario.id)
        if @pedido_orcamentos.empty?
            @contagem += 1
        end

        if @contagem == 3
            return true
        else
            return false
        end
    end
end
