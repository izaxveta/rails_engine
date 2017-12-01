class Api::V1::InvoiceItems::FindAllController < ApplicationController
  def index
    byebug
    render json: InvoiceItem.find_all_invoice_items(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end