FactoryBot.define do
  
  factory :first_label, class: Label do
    name { "school" }
  end

  factory :second_label, class: Label do
    name { "company" }
  end

  factory :third_label, class: Label do
    name { "home" }
  end
end
