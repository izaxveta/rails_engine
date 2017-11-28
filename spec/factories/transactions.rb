FactoryBot.define do
  factory :transaction do
    invoice_id nil
    credit_card_number "MyText"
    credit_card_expiration_date ""
    result "MyText"
  end
end
