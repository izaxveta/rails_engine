class Transaction < ApplicationRecord
  belongs_to :invoice

  def success
    true if self.result == "success"
  end 
end
