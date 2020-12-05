class PedidoSuppliersController < ApplicationController
    def index
        @pedido_suppliers = PedidoSupplier.all
        @suppliers = Supplier.all
        @funcionarios = Funcionario.all
    end

    def show
        @pedido_supplier = PedidoSupplier.find(params[:id])
        @supplier = Supplier.find(@pedido_supplier.id_fornecedor)
        @funcionario = Funcionario.find(@pedido_supplier.id_funcionario)
    end

    def new
        @pedido_supplier = PedidoSupplier.new
        @suppliers = Supplier.all
        @funcionarios = Funcionario.all
    end

    def create
        @pedido_supplier = PedidoSupplier.new(pedido_params)
        if @pedido_supplier.valid?
            @pedido_supplier.save
            redirect_to @pedido_supplier
        else
            @suppliers = Supplier.all
            @funcionarios = Funcionario.all
            flash.now[:notice] = "É necessário preencher todos os campos."
            render :new
        end
    end

    def edit
        @pedido_supplier = PedidoSupplier.find(params[:id])
        @suppliers = Supplier.all
        @funcionarios = Funcionario.all
    end

    def update
        @pedido_supplier = PedidoSupplier.find(params[:id])
        @pedido_supplier.update(pedido_params)
        redirect_to @pedido_supplier
    end

    def destroy
        @pedido_supplier = PedidoSupplier.find(params[:id])
        if excluir_item_supplier(@pedido_supplier)
            @pedido_supplier.destroy
            redirect_to pedido_suppliers_path
        else
            flash[:notice] = "Não é possível excluir o pedido nº #{@pedido_supplier.id}. Há dependências."
            redirect_to pedido_suppliers_path
        end        
    end

    private
    def pedido_params
        params.require(:pedido_supplier).permit(:id_fornecedor, :data, :id_funcionario)
    end

    private 
    def excluir_item_supplier(pedido_supplier)
        @item_pedidos = ItemPedido.where(pedido_supplier_id: pedido_supplier.id)
        if @item_pedidos.empty?
            return true
        end
        return false
    end
    
end
