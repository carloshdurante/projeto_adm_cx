class Api::V1::EmpjrController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        render json: Empjr.all        
    end

    def show
        empjr = Empjr.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Empregado JR Carregado',
            data:empjr
        }, status: :ok
    end

    def create
        empjr = Empjr.new(empjr_params)
        if empjr.save
            render json: {
                status: 'Sucesso',
                message: 'Empregado JR Criado',
                data:empjr
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Empregado JR não criado',
                data: empjr.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        empjr = Empjr.find(params[:id])
        if empjr.update(empjr_params)
            render json:{
                status: 'Sucesso',
                message: 'Empregado JR atualizado',
                data:empjr
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Empregado JR não atualizado',
                data:empjr.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        empjr = Empjr.find(params[:id])
        empjr.destroy
        render json: {
            status: 'Sucesso',
            message: 'Empregado JR deletado',
            data:empjr
        }, status: :ok
    end

    def empjr_params
        params.require(:empjr).permit(:nome, :sobrenome, :idade, :emexperiencia, :salario, :coordenador_id, :company_id)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end


