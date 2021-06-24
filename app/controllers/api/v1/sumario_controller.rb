class Api::V1::SumarioController < ApplicationController
    def index
      companies = Company.all
      list = []
      companies.each do |company| 
        companhia = company.nome
        cnpj = company.cnpj
        nome_fundador = company.fundador.nome
        liders = Lider.joins(:company).where("liders.company_id = #{company.id}").count
        coords = Coordenador.joins(:company).where("coordenadors.company_id = #{company.id}").count
        empjrs = Empjr.joins(:company).where("empjrs.company_id = #{company.id}").count
        empsrs = Empsr.joins(:company).where("empsrs.company_id = #{company.id}").count
        list << {
          companhia: companhia,
          cnpj: cnpj,
          fundador: nome_fundador,
          totalfunc: liders + coords + empjrs + empsrs,
          liders: liders,
          coords: coords,
          empjrs: empjrs,
          empsrs: empsrs
        }
      end
      render json: list
    end
  end