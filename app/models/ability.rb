# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.present? && user.admin == true

    can :read, Howto if user.present?

    can :read, :all if user.institute == 'Ufficio Amministrazione'

    if user.institute == 'Patronato INCA'
      can :read, IncaReceipt
      can :create, IncaReceipt
      can :update, IncaReceipt do |inca_receipt|
        inca_receipt.user == user
      end
      can :billdownload, IncaReceipt do |inca_receipt|
        inca_receipt.user == user
      end
      can :read, IncaSubscription
      can :create, IncaSubscription
      can :update, IncaSubscription do |inca_subscription|
        inca_subscription.user == user
      end
    end
  end
end
