class PedidoOrcamentosController < ApplicationController
    def index
        @pedido_orcamentos = PedidoOrcamento.all
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
        @array_valor_total = calcular_valor_total(@pedido_orcamentos)
        puts @array_valor_total
    end

    def show
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @cliente = Cliente.find(@pedido_orcamento.id_cliente)
        @tipo_aparelho = TipoAparelho.find(@pedido_orcamento.id_aparelho)
        @status_autorizacao = State.find(@pedido_orcamento.status_autorizacao)
        @funcionario = Funcionario.find(@pedido_orcamento.id_funcionario)
        @valor_produto = calcular_valor_produto_pedido(@pedido_orcamento)
    end

    def new
        @pedido_orcamento = PedidoOrcamento.new
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
    end

    def create
        @pedido_orcamento = PedidoOrcamento.new(pedido_params)
        if @pedido_orcamento.valid?
            @pedido_orcamento.save
            redirect_to @pedido_orcamento
        else
            @clientes = Cliente.all
            @tipo_aparelhos = TipoAparelho.all
            @status_autorizacoes = State.where(tipo_status: 'Autorização')
            @funcionarios = Funcionario.all
            flash.now[:notice] = "É necessário preencher todos os campos."
            render :new
        end
    end

    def edit
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
    end

    def update
        @aprovado = 0

        @status_autorizado = State.where(descricao_status: 'Autorizado pelo Cliente')
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @pedido_orcamento.update(pedido_params)

        if Integer(@pedido_orcamento.status_autorizacao) == Integer(@status_autorizado.ids[0])
            redirect_to new_servico_path
        else
            redirect_to @pedido_orcamento
        end
    end

    def destroy
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        if excluir_item_orcamento(@pedido_orcamento)
            @pedido_orcamento.destroy
            redirect_to pedido_orcamentos_path
        else
            flash[:notice] = "Não é possível excluir o pedido nº #{@pedido_orcamento.id}. Há dependências."
            redirect_to pedido_orcamentos_path
        end
    end

    private
    def pedido_params
        params.require(:pedido_orcamento).permit(:id_cliente, :id_aparelho, :valor_mao_de_obra, :status_autorizacao, :data, :id_funcionario)
    end

    private
    def calcular_valor_total(pedido_orcamentos)
        @array = []
        pedido_orcamentos.each do |pedido_orcamento| 
            @valor_produto = 0
            @item_orcamentos = ItemOrcamento.where(pedido_orcamento_id: pedido_orcamento.id)
            @item_orcamentos.each do |item_orcamento|
                @produto = Produto.find(item_orcamento.produto_id)
                @valor_produto += @produto.preco * item_orcamento.quantidade
            end
            @item = {"pedido_orcamento_id" => pedido_orcamento.id, "valor_total" => @valor_produto + pedido_orcamento.valor_mao_de_obra}
            @array << @item
        end  
        return @array      
    end

    private
    def calcular_valor_produto_pedido(pedido_orcamento)
        @valor_produto = 0
        @item_orcamentos = ItemOrcamento.where(pedido_orcamento_id: pedido_orcamento.id)
        @item_orcamentos.each do |item_orcamento|
            @produto = Produto.find(item_orcamento.produto_id)
            @valor_produto += @produto.preco * item_orcamento.quantidade
        end         
        return @valor_produto     
    end

    private 
    def excluir_item_orcamento(pedido_orcamento)
        @item_orcamentos = ItemOrcamento.where(pedido_orcamento_id: pedido_orcamento.id)
        if @item_orcamentos.empty?
            return true
        end
        return false
    end
end
