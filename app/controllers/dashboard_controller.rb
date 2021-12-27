class DashboardController < ApplicationController
  def index; end

  def credits; end

  def authorization; end

  def statistic
    # INCA
    @inca_receipts = IncaReceipt.all
    @inca_subscriptions_new = IncaSubscription.where(subscription_typology_id: 1)
    @inca_subscriptions_renew = IncaSubscription.where(subscription_typology_id: 2)
    @inca_subscriptions = IncaSubscription.all
    # Offices
    @inca_subscription_offices = IncaOffice.where.not(inca_subscriptions: nil)
    @inca_receipt_offices = IncaOffice.where.not(inca_receipts: nil)
  end

  def chart
    # INCA
    @inca_receipts = IncaReceipt.all
    @inca_subscriptions_new = IncaSubscription.where(subscription_typology_id: 1)
    @inca_subscriptions_renew = IncaSubscription.where(subscription_typology_id: 2)
    @inca_subscriptions = IncaSubscription.all

    # Offices
    @inca_subscription_offices = IncaOffice.where.not(inca_subscriptions: nil)
    @inca_receipt_offices = IncaOffice.where.not(inca_receipts: nil)

    # INCA Practises
    @inca_practises = IncaPractise.all
  end
end
