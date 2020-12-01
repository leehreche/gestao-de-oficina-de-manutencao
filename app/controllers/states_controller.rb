class StatesController < ApplicationController
    def index
        @states = State.all
    end

    def show
        @state = State.find(params[:id])
    end

    def new
        @state = State.new
    end

    def create
        @state = State.new(state_params)
        @state.save
        redirect_to @state
    end

    def edit
        @state = State.find(params[:id])
    end

    def update
        @state = State.find(params[:id])
        @state.update(state_params)
        redirect_to @state
    end

    def destroy
        @state = State.find(params[:id])
        @state.destroy
        redirect_to states_path
    end

    private
    def state_params
        params.require(:state).permit(:tipo_status, :descricao_status)
    end
end
