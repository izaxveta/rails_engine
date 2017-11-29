class Transaction < ApplicationRecord
  belongs_to :invoice

  # scope :success, ->{ where(result: ‘success’) }
  # scope :failure, ->{ where(result: ‘failure’) }

  def self.find_transaction(params)
    find_by(params)
  end

  def self.find_all_transactions(params)
    where(params)
  end

  # def self.success
  #   where(result: 'success')
  # end
end
