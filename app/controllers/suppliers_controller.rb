class SuppliersController < ApplicationController
    def index
        @suppliers = Supplier.all
    end

    def show
        @supplier = Supplier.find(params[:id])
    end

    def new
        @supplier = Supplier.new
    end

    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.valid?
            @supplier.save
            redirect_to @supplier
        else
            flash.now[:notice] = "É necessário preencher todos os campos."
            render :new
        end
    end

    def edit
        @supplier = Supplier.find(params[:id])
    end

    def update
        @supplier = Supplier.find(params[:id])
        @supplier.update(supplier_params)
        redirect_to @supplier
    end

    def destroy
        @supplier = Supplier.find(params[:id])
        if excluir_supplier(@supplier)
            @supplier.destroy
            redirect_to suppliers_path
        else 
            flash[:notice] = "Não é possível excluir o fornecedor #{@supplier.nome_fantasia}. Há dependências."
            redirect_to suppliers_path
        end
    end

    private
    def supplier_params
        params.require(:supplier).permit(:cnpj, :razao_social, :nome_fantasia, :endereco, :cidade, :estado, :telefone)
    end

    private 
    def excluir_supplier(supplier)
        @pedido_suppliers = PedidoSupplier.where(id_fornecedor: supplier.id)
        if @pedido_suppliers.empty?
            return true
        end
        return false
    end
end