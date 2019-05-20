FactoryBot.define do
  factory :player, class: Player do
    name { "FAKE PLAYER" }
    position { 1 }
  end

  factory :nameless_player, class: Player do
    name { "" }
    position { 1 }
  end

  factory :nil_player, class: Player do
    name { nil }
    position { nil }
  end

end