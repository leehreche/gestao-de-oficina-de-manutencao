class TipoAparelhosController < ApplicationController
    def index
        @tipo_aparelhos = TipoAparelho.all
    end

    def show
        @tipo_aparelho = TipoAparelho.find(params[:id])
    end

    def new
        @tipo_aparelho = TipoAparelho.new
    end

    def create
        @tipo_aparelho = TipoAparelho.new(tipo_aparelho_params)
        @tipo_aparelho.save
        redirect_to @tipo_aparelho
    end

    def edit
        @tipo_aparelho = TipoAparelho.find(params[:id])
    end

    def update
        @tipo_aparelho = TipoAparelho.find(params[:id])
        @tipo_aparelho.update(tipo_aparelho_params)
        redirect_to @tipo_aparelho
    end

    def destroy
        @tipo_aparelho = TipoAparelho.find(params[:id])
        @tipo_aparelho.destroy
        redirect_to tipo_aparelhos_path
    end

    private
    def tipo_aparelho_params
        params.require(:tipo_aparelho).permit(:nome, :prazo_manutencao)
    end
end
