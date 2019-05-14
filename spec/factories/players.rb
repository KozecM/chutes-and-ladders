FactoryBot.define do
  factory :player, class: Player do
    name { "FAKE PLAYER" }
  end

  factory :bad_player, class: Player do
    name { "" }
  end

  factory :nil_player, class: Player do
    name { nil }
  end

end