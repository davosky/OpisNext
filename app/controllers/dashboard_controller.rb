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

    # GENERIC
    @generic_subscriptions_new = GenericSubscription.where(subscription_typology_id: 1)
    @generic_subscriptions_renew = GenericSubscription.where(subscription_typology_id: 2)
    @generic_subscriptions = GenericSubscription.all

    # Offices
    @inca_subscription_offices = IncaOffice.where.not(inca_subscriptions: nil)
    @inca_receipt_offices = IncaOffice.where.not(inca_receipts: nil)
    @generic_subscription_offices = GenericOffice.all
  end

  def chart
    # INCA
    @inca_receipts = IncaReceipt.all
    @inca_subscriptions = IncaSubscription.all
    @generic_subscriptions = GenericSubscription.all

    # GENERIC
    @inca_receipts_total = @inca_receipts.count
    @inca_subscriptions_total = @inca_subscriptions.count
    @generic_subscriptions_total = @generic_subscriptions.count

    # Offices
    @inca_subscription_offices = IncaOffice.where.not(inca_subscriptions: nil)
    @inca_receipt_offices = IncaOffice.where.not(inca_receipts: nil)
    @generic_subscription_offices = GenericOffice.all
  end
end
