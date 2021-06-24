class Api::V1::CoordenadorController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        render json: Coordenador.all        
    end

    def show
        coordenador = Coordenador.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Coordenador Carregado',
            data:coordenador
        }, status: :ok
    end

    def create
        coordenador = Coordenador.new(coordenador_params)
        if coordenador.save
            render json: {
                status: 'Sucesso',
                message: 'Coordenador Criado',
                data:coordenador
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Coordenador não criado',
                data: coordenador.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        coordenador = Coordenador.find(params[:id])
        if coordenador.update(coordenador_params)
            render json:{
                status: 'Sucesso',
                message: 'Coordenador atualizado',
                data:coordenador
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Coordenador não atualizado',
                data:coordenador.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        coordenador = Coordenador.find(params[:id])
        coordenador.destroy
        render json: {
            status: 'Sucesso',
            message: 'Coordenador deletado',
            data:coordenador
        }, status: :ok
    end

    def coordenador_params
        params.require(:coordenador).permit(:nome, :sobrenome, :idade, :contratadoem, :lider_id, :company_id)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end

