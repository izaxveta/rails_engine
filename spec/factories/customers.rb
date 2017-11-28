FactoryBot.define do
  factory :customer do
    sequence :first_name do
      Faker::Cat.name
    end

    sequence :last_name do
      Faker::Cat.name
    end

    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end
end
