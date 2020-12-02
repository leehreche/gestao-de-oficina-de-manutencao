class PedidosController < ApplicationController

    def new
        @pedido = Pedido.new
    end

    def create
        @pedido = Pedido.new(pedido_params)
        @pedido.save
        redirect_to @pedido
    end

    def edit
        @pedido = Pedido.find(params[:id])
    end

    def update
        @pedido = Pedido.find(params[:id])
        @pedido.update(pedido_params)
        redirect_to @pedido
    end

    def destroy
        @pedido = Pedido.find(params[:id])
        @pedido.destroy
        redirect_to pedidos_path
    end

    private
    def pedido_params
        params.require(:pedido.permit(:data))
    end
end
