# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_24_043657) do

  create_table "companies", force: :cascade do |t|
    t.string "nome"
    t.integer "cnpj", limit: 14
    t.string "fundacao"
    t.integer "fundador_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fundador_id"], name: "index_companies_on_fundador_id"
  end

  create_table "coordenadors", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "idade", limit: 2
    t.date "contratadoem"
    t.integer "lider_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_coordenadors_on_company_id"
    t.index ["lider_id"], name: "index_coordenadors_on_lider_id"
  end

  create_table "empjrs", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "idade", limit: 2
    t.boolean "emexperiencia"
    t.float "salario"
    t.integer "coordenador_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_empjrs_on_company_id"
    t.index ["coordenador_id"], name: "index_empjrs_on_coordenador_id"
  end

  create_table "empsrs", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "idade", limit: 2
    t.boolean "emexperiencia"
    t.float "salario"
    t.integer "coordenador_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_empsrs_on_company_id"
    t.index ["coordenador_id"], name: "index_empsrs_on_coordenador_id"
  end

  create_table "fundadors", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "idade", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liders", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "idade", limit: 2
    t.string "area"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_liders_on_company_id"
  end

  add_foreign_key "companies", "fundadors"
  add_foreign_key "coordenadors", "companies"
  add_foreign_key "coordenadors", "liders"
  add_foreign_key "empjrs", "companies"
  add_foreign_key "empjrs", "coordenadors"
  add_foreign_key "empsrs", "companies"
  add_foreign_key "empsrs", "coordenadors"
  add_foreign_key "liders", "companies"
end
