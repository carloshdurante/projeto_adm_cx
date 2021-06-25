class Api::V1::ContratacaoController < ApplicationController
    def index
    end
    def create
        if params_verificao[:nivel] == 'jr'
            contratacao = Empjr.new(contratacao_params)
            if contratacao.save
                render json: {
                    status: 'Sucesso',
                    message: 'Líder Criado',
                    data:contratacao
                }, status: :ok
            else
                render json: {
                    status: 'Erro',
                    message: 'Líder não criado',
                    data: contratacao.errors
                },  status: :unprocessable_entity
            end
        elsif params_verificao[:nivel] == 'sr'
            contratacao = Empjr.new(contratacao_params)
            if contratacao.save
                render json: {
                    status: 'Sucesso',
                    message: 'Empregado JR Criado',
                    data:contratacao
                }, status: :ok
            else
                render json: {
                    status: 'Erro',
                    message: 'Empregado JR não criado',
                    data: empjr.errors
                },  status: :unprocessable_entity
            end
        else
            render json: {
                    status: 'Erro',
                    message: 'Nivel empregado invalido',
            }
        end
    end

    def params_verificao
        params.require(:verificacao).permit(:nivel)
    end
    def contratacao_params
        params.require(:contratacao).permit(:nome, :sobrenome, :idade, :emexperiencia, :salario, :coordenador_id, :company_id)
    end
end
