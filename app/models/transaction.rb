class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> { where(result: "success") }
  scope :failure,    -> { where(result: "failed") }

  default_scope { order(:id) }

  def self.find_transaction(params)
    find_by(params)
  end

  def self.find_all_transactions(params)
    where(params)
  end
end
