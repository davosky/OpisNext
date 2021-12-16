# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.present? && user.admin == true

    can :read, Howto if user.present?

    if user.institute == 'Ufficio Amministrazione'
      can :billdownload, IncaReceipt
      can :billdownload, IncaSubscription
      can :billdownloadnidil, IncaSubscription
      can :read, IncaReceipt
      can :read, IncaSubscription
      can :billdownload, GenericSubscription
      can :billdownloadnidil, GenericSubscription
      can :read, GenericSubscription
    end

    if user.institute == 'Patronato INCA'
      can :billdownload, IncaReceipt do |inca_receipt|
        inca_receipt.user == user
      end
      can :billdownload, IncaSubscription do |inca_subscription|
        inca_subscription.user == user
      end
      can :billdownloadnidil, IncaSubscription do |inca_subscription|
        inca_subscription.user == user
      end
      can :read, IncaReceipt
      can :create, IncaReceipt
      can :update, IncaReceipt do |inca_receipt|
        inca_receipt.user == user
      end
      can :read, IncaSubscription
      can :create, IncaSubscription
      can :update, IncaSubscription do |inca_subscription|
        inca_subscription.user == user
      end
    end

    if user.institute != 'Patronato INCA'
      can :billdownload, GenericSubscription do |generic_subscription|
        generic_subscription.user == user
      end
      can :billdownloadnidil, GenericSubscription do |generic_subscription|
        generic_subscription.user == user
      end
      can :read, GenericSubscription
      can :create, GenericSubscription
      can :update, GenericSubscription do |generic_subscription|
        generic_subscription.user == user
      end
    end
  end
end
