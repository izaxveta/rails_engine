class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def index 
    invoice_item = InvoiceItem.find(params[:invoice_item_id])
    render json: invoice_item.invoice, serializer: InvoiceSerializer
  end 

end 