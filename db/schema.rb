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

ActiveRecord::Schema[7.0].define(version: 2022_11_18_001657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "uf_id", null: false
    t.integer "ibge"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["uf_id"], name: "index_cidades_on_uf_id"
  end

  create_table "cidadess", id: false, force: :cascade do |t|
    t.bigint "id"
    t.string "nome"
    t.bigint "uf_id"
    t.integer "ibge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conselhoclasses", force: :cascade do |t|
    t.string "sigla", null: false
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.string "tipo_escala"
    t.bigint "unidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_id"], name: "index_equipes_on_unidade_id"
  end

  create_table "estabelecimentos", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "cnes"
    t.string "endereco"
    t.string "end_numero"
    t.string "complemento"
    t.string "bairro"
    t.bigint "uf_id", null: false
    t.bigint "cidade_id", null: false
    t.string "cep"
    t.string "api_url"
    t.string "api_usuario"
    t.string "api_senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_estabelecimentos_on_cidade_id"
    t.index ["uf_id"], name: "index_estabelecimentos_on_uf_id"
  end

  create_table "membros", force: :cascade do |t|
    t.bigint "equipe_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_membros_on_equipe_id"
    t.index ["user_id"], name: "index_membros_on_user_id"
  end

  create_table "turnos", force: :cascade do |t|
    t.bigint "equipe_id", null: false
    t.integer "ordem", null: false
    t.time "hora_inicio", null: false
    t.time "hora_fim", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_turnos_on_equipe_id"
  end

  create_table "ufs", force: :cascade do |t|
    t.string "sigla"
    t.string "nome"
  end

  create_table "unidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estabelecimento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estabelecimento_id"], name: "index_unidades_on_estabelecimento_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "cpf"
    t.string "nome_chamado"
    t.string "sexo"
    t.string "profissao"
    t.bigint "conselhoclass_id"
    t.string "numero_conselho"
    t.bigint "uf_conselho_id"
    t.index ["conselhoclass_id"], name: "index_users_on_conselhoclass_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uf_conselho_id"], name: "index_users_on_uf_orgao_classe_id"
  end

  add_foreign_key "cidades", "ufs"
  add_foreign_key "equipes", "unidades"
  add_foreign_key "estabelecimentos", "cidades"
  add_foreign_key "estabelecimentos", "ufs"
  add_foreign_key "membros", "equipes"
  add_foreign_key "membros", "users"
  add_foreign_key "turnos", "equipes"
  add_foreign_key "unidades", "estabelecimentos"
  add_foreign_key "users", "conselhoclasses"
  add_foreign_key "users", "ufs", column: "uf_conselho_id"
end
