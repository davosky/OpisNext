# frozen_string_literal: true

module ApplicationHelper
  def admin?
    current_user.admin == true
  end

  def full_user
    "#{current_user.name} - #{current_user.institute}"
  end

  def inca_receipt_customer_full_name(inca_receipt)
    "#{inca_receipt.customer_name} #{inca_receipt.customer_forname}"
  end

  def inca_subscription_customer_full_name(inca_subscription)
    "#{inca_subscription.customer_name} #{inca_subscription.customer_forname}"
  end

  def cancelled?(inca_receipt)
    'text-white bg-primary' if inca_receipt.cancellation
  end
end
