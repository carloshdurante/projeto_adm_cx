class Api::V1::CompanyController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index       
        render json: Company.all 
    end

    def show
        company = Company.find(params[:id])
        render json: {
            status: 'Sucesso',
            message: 'Companhia Carregada',
            data:company
        }, status: :ok
    end

    def create
        company = Company.new(company_params)
        if company.save
            render json: {
                status: 'Sucesso',
                message: 'Companhia Criada',
                data:company
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Companhia não criada',
                data: company.errors
            },  status: :unprocessable_entity
        end
    end

    def update
        company = Company.find(params[:id])
        if company.update(company_params)
            render json:{
                status: 'Sucesso',
                message: 'Companhia atualizada',
                data:company
            }, status: :ok
        else
            render json: {
                status: 'Erro',
                message: 'Companhia não atualizada',
                data:company.errors
            },  status: :unprocessable_entity
        end
    end

    def destroy
        company = Company.find(params[:id])
        company.destroy
        render json: {
            status: 'Sucesso',
            message: 'Companhia deletada',
            data:company
        }, status: :ok
    end

    def company_params
        params.require(:company).permit(:nome, :cnpj, :fundacao, :fundador_id)
    end

    def record_not_found
        render json:{
            status: 404,
            message: 'Registro não existe'
        }
    end
end
