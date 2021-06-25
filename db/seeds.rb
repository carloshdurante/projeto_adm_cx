# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
    fundador = Fundador.create nome: Faker::Name.first_name, sobrenome: Faker::Name.last_name, idade: 20 + i
    companhia = Company.create!(nome: Faker::Company.name, cnpj: 12345678901234 + i, fundacao: Date.today, fundador_id: fundador.id)
    lider = Lider.create!(nome: Faker::Name.first_name, sobrenome: Faker::Name.last_name, idade: 27 + i, area: Faker::Job.field, company_id: companhia.id)
    coordenador = Coordenador.create!(nome: Faker::Name.first_name, sobrenome: Faker::Name.last_name, idade: 30 + i, contratadoem: Date.today, lider_id: lider.id, company_id: companhia.id)
    empjr = Empjr.create!(nome: Faker::Name.first_name, sobrenome: Faker::Name.last_name, idade: 19 + i, emexperiencia: true, salario: 2500.57, coordenador_id: coordenador.id, company_id: companhia.id)
    empsr = Empsr.create!(nome: Faker::Name.first_name, sobrenome: Faker::Name.last_name, idade: 24 + i, emexperiencia: true, salario: 8500.57, coordenador_id: coordenador.id, company_id: companhia.id)
end


