# Migration to add unidades_count column to Estabelecimentos table
class AddUnidadesCountToEstabelecimentos < ActiveRecord::Migration[7.0]
  def change
    add_column :estabelecimentos, :unidades_count, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE estabelecimentos
            set unidades_count = (select count(*) from unidades where estabelecimento_id=estabelecimentos.id);
        SQL
      end
    end
  end
end
