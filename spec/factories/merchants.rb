FactoryBot.define do
  factory :merchant do
    sequence :name do
      Faker::Zelda.character
    end
  end
end
