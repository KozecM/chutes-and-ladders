FactoryBot.define do
  factory :mack, class: Player do
    name { "Mack" }
    position { 1 }
  end

  factory :bad_player, class: Player do
    name { "" }
    position { 1 }
  end

  factory :nil_player, class: Player do
    name { nil }
    position { 1 }
  end
end