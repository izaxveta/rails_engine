class Transaction < ApplicationRecord
  belongs_to :invoice

  # scope :success, ->{ where(result: ‘success’) }
  # scope :failure, ->{ where(result: ‘failure’) }

  def self.success
    where(result: 'success')
  end 
end
