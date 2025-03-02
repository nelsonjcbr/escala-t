# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.organizer?
      can :manage, Conselhoclass
      can :manage, Equipe
      can :manage, Escala
      can :manage, Escalacmpt
      can :manage, Escaladay
      can :manage, Membro
      can :manage, Unidade
      can :manage, User
      can :manage, Userconf
    elsif user.user?
      can :read, Escalacmpt
      can %i[read update destroy], User, id: user.id
    end
  end
end
