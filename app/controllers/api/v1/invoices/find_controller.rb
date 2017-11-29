class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.find_invoice(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :merchant_id, :customer_id, :created_at, :updated_at)
  end
end