class StatusController < ApplicationController
    def index
        @statuss = Status.all
    end

    def show
        @status = Status.find(params[:id])
    end

    def new
        @status = Status.new
    end

    def create
        @status = Status.new(status_params)
        @status.save
        redirect_to @status
    end

    def edit
        @status = Status.find(params[:id])
    end

    def update
        @status = Status.find(params[:id])
        @status.update(status_params)
        redirect_to @status
    end

    def destroy
        @status = Status.find(params[:id])
        @status.destroy
        redirect_to clientes_path
    end

    private
    def status_params
        params.require(:status).permit(:tipo_status, :descricao)
    end
end
