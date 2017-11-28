FactoryBot.define do
  factory :transaction do
    sequence :credit_card_number do
      Faker::Business.credit_card_number
    end

    credit_card_expiration_date ""
    result "success"
    invoice
  end
end
