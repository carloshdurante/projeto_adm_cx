class Api::V1::FundadorController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
        render json: Fundador.all       
    end

    def show
        fundador = Fundador.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Fundador Carregado',
            data:fundador
        }, status: :ok
    end

    def create
        fundador = Fundador.new(fundador_params)
        if fundador.save
            render json: {
                status: 'Sucesso',
                message: 'Fundador Criado',
                data:fundador
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Fundador não criado',
                data: fundador.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        fundador = Fundador.find(params[:id])
        if fundador.update(fundador_params)
            render json:{
                status: 'Sucesso',
                message: 'Fundador atualizado',
                data:fundador
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Fundador não atualizado',
                data:fundador.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        fundador = Fundador.find(params[:id])
        fundador.destroy
        render json: {
            status: 'Sucesso',
            message: 'Fundador deletado',
            data:fundador
        }, status: :ok
    end

    def fundador_params
        params.require(:fundador).permit(:nome, :sobrenome, :idade)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end
