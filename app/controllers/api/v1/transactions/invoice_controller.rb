class Api::V1::Transactions::InvoiceController < ApplicationController
  def index
    transaction = Transaction.find(transaction_params[:transaction_id].to_i)
    render json: transaction.invoice, serializer: InvoiceSerializer
  end

  private

  def transaction_params
    params.permit(:transaction_id)
  end
end