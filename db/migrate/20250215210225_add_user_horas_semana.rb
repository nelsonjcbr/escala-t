class AddUserHorasSemana < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :horas_semana, :integer
  end
end
