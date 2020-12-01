# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_230837) do

  create_table "clientes", force: :cascade do |t|
    t.integer "cpf"
    t.string "nome"
    t.string "endereco"
    t.string "cidade"
    t.string "estado"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "cnpj"
    t.string "razao_social"
    t.string "nome_fantasia"
    t.string "endereco"
    t.string "cidade"
    t.string "estado"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.integer "cpf"
    t.string "nome"
    t.string "cargo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.integer "id_produto"
    t.integer "id_pedido"
    t.integer "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedido_fornecedors", force: :cascade do |t|
    t.integer "id_fornecedor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedido_orcamentos", force: :cascade do |t|
    t.integer "id_cliente"
    t.integer "id_aparelho"
    t.float "valor_mao_de_obra"
    t.integer "status_autorizacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.date "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "descricao"
    t.integer "quantidade"
    t.float "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.integer "id_funcionario"
    t.integer "id_pedido"
    t.integer "id_aparelho"
    t.string "descricao_servico"
    t.integer "status_andamento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "tipo_status"
    t.string "descricao_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "status", force: :cascade do |t|
    t.string "tipo_status"
    t.string "descricao_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "tipo_status"
    t.string "descricao_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "cnpj"
    t.string "razao_social"
    t.string "nome_fantasia"
    t.string "endereco"
    t.string "cidade"
    t.string "estado"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipo_aparelhos", force: :cascade do |t|
    t.string "nome"
    t.integer "prazo_manutencao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
