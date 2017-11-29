class Api::V1::Invoices::FindAllController < ApplicationController
  def index
    render json: Invoice.find_all_invoices(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :merchant_id, :customer_id, :created_at, :updated_at)
  end
end