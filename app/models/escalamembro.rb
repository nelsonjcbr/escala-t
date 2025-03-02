class Escalamembro < ApplicationRecord
  belongs_to :membro, class_name: 'User'
  belongs_to :escala

  validate :profissional_disponivel

  private

  def profissional_disponivel
    # Verifica se o usuário está indisponível no período desejado
    data_escala = escala.escaladay.data
    hora_inicio_turno = escala.turno.hora_inicio
    hora_fim_turno = escala.turno.hora_fim

    indisponivel = UserIndisp.where(user_id: membro_id)
                             .where('(data_inicio IS NULL or ? BETWEEN data_inicio AND data_fim) and ' +
                                    '(dia_semana IS NULL or dia_semana = ?) and ' +
                                    '(hora_inicio is null or ? BETWEEN hora_inicio AND hora_fim or ? BETWEEN hora_inicio AND hora_fim)',
                                    data_escala, (data_escala.wday + 1).to_s, hora_inicio_turno, hora_fim_turno)
                             .first

    return if indisponivel.nil?

    mostra_erro = 'Usuário indisponivel: '
    mostra_erro += "de #{indisponivel.data_inicio} até #{indisponivel.data_fim}, " unless indisponivel.data_inicio.nil?
    unless indisponivel.dia_semana.nil?
      mostra_erro += "dia semana=#{UserIndisp.dias_semanas.key(indisponivel.dia_semana.to_i)}, "
    end
    unless indisponivel.hora_inicio.nil?
      mostra_erro += "das #{indisponivel.hora_inicio.strftime('%H:%M')} às #{indisponivel.hora_fim.strftime('%H:%M')} "
    end
    mostra_erro += "mas foi lançado em #{data_escala}>#{hora_inicio_turno.strftime('%H:%M')}-#{hora_fim_turno.strftime('%H:%M')}."

    errors.add(:base, mostra_erro)
  end
end
