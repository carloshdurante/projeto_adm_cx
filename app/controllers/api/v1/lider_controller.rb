class Api::V1::LiderController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        render json: Lider.all        
    end

    def show
        lider = Lider.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Líder Carregado',
            data:lider
        }, status: :ok
    end

    def create
        lider = Lider.new(lider_params)
        if lider.save
            render json: {
                status: 'Sucesso',
                message: 'Líder Criado',
                data:lider
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Líder não criado',
                data: lider.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        lider = Lider.find(params[:id])
        if lider.update(lider_params)
            render json:{
                status: 'Sucesso',
                message: 'Líder atualizado',
                data:lider
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Líder não atualizado',
                data:lider.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        lider = Lider.find(params[:id])
        lider.destroy
        render json: {
            status: 'Sucesso',
            message: 'Líder deletado',
            data:lider
        }, status: :ok
    end

    def lider_params
        params.require(:lider).permit(:nome, :sobrenome, :idade, :area, :company_id)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end

