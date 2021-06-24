class Api::V1::EmpsrController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        render json: Empsr.all        
    end

    def show
        empsr = Empsr.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Empregado SR Carregado',
            data:empsr
        }, status: :ok
    end

    def create
        empsr = Empsr.new(empsr_params)
        if empsr.save
            render json: {
                status: 'Sucesso',
                message: 'Empregado SR Criado',
                data:empsr
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Empregado SR não criado',
                data: empsr.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        empsr = Empsr.find(params[:id])
        if empsr.update(empsr_params)
            render json:{
                status: 'Sucesso',
                message: 'Empregado SR atualizado',
                data:empsr
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Empregado SR não atualizado',
                data:empsr.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        empsr = Empsr.find(params[:id])
        empsr.destroy
        render json: {
            status: 'Sucesso',
            message: 'Empregado SR deletado',
            data:empsr
        }, status: :ok
    end

    def empsr_params
        params.require(:empsr).permit(:nome, :sobrenome, :idade, :emexperiencia, :salario, :coordenador_id, :company_id)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end
