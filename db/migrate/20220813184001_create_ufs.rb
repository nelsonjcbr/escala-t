class CreateUfs < ActiveRecord::Migration[7.0]
  def up
    create_table :ufs do |t|
      t.string :sigla
      t.string :nome
    end
    Uf.create(id: 12,	sigla: 'AC', nome: 'Acre')
    Uf.create(id: 27,	sigla: 'AL', nome: 'Alagoas')
    Uf.create(id: 13,	sigla: 'AM', nome: 'Amazonas')
    Uf.create(id: 16,	sigla: 'AP', nome: 'Amapá')
    Uf.create(id: 29,	sigla: 'BA', nome: 'Bahia')
    Uf.create(id: 23,	sigla: 'CE', nome: 'Ceará')
    Uf.create(id: 53,	sigla: 'DF', nome: 'Distrito Federal')
    Uf.create(id: 32,	sigla: 'ES', nome: 'Espírito Santo')
    Uf.create(id: 20,	sigla: 'FN', nome: 'Fernando De Noronha')
    Uf.create(id: 52,	sigla: 'GO', nome: 'Goiás')
    Uf.create(id: 21,	sigla: 'MA', nome: 'Maranhão')
    Uf.create(id: 31,	sigla: 'MG', nome: 'Minas Gerais')
    Uf.create(id: 50,	sigla: 'MS', nome: 'Mato Grosso do Sul')
    Uf.create(id: 51,	sigla: 'MT', nome: 'Mato Grosso')
    Uf.create(id: 15,	sigla: 'PA', nome: 'Pará')
    Uf.create(id: 25,	sigla: 'PB', nome: 'Paraíba')
    Uf.create(id: 26,	sigla: 'PE', nome: 'Pernambuco')
    Uf.create(id: 22,	sigla: 'PI', nome: 'Piauí')
    Uf.create(id: 41,	sigla: 'PR', nome: 'Paraná')
    Uf.create(id: 33,	sigla: 'RJ', nome: 'Rio de Janeiro')
    Uf.create(id: 24,	sigla: 'RN', nome: 'Rio Grande do Norte')
    Uf.create(id: 11,	sigla: 'RO', nome: 'Rondônia')
    Uf.create(id: 14,	sigla: 'RR', nome: 'Roraima')
    Uf.create(id: 43,	sigla: 'RS', nome: 'Rio Grande do Sul')
    Uf.create(id: 42,	sigla: 'SC', nome: 'Santa Catarina')
    Uf.create(id: 28,	sigla: 'SE', nome: 'Sergipe')
    Uf.create(id: 35,	sigla: 'SP', nome: 'São Paulo')
    Uf.create(id: 17,	sigla: 'TO', nome: 'Tocantins')
    Uf.create(id: 99,	sigla: 'XX', nome: 'Outro Pais')
  end
  def def down 
    drop_table :uf
  end
end