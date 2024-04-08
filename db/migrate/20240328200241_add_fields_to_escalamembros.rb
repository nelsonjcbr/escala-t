class AddFieldsToEscalamembros < ActiveRecord::Migration[7.0]
  def change
    add_column :escalamembros, :avulso,  :boolean
    add_column :escalamembros, :abonado, :boolean
    add_column :escalamembros, :check_in, :timestamp
    add_column :escalamembros, :check_out, :timestamp
  end
end
