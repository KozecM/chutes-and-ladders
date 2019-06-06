FactoryBot.define do
  factory :player, class: Player do
    name { "FAKE PLAYER" }
    position { 1 }
  end

  factory :player2, class: Player do
    name { "FAKE PLAYER 2"}
    position { 1 }
  end

  factory :player_pos_10, class: Player do
    name { "FAKE PLAYER_10"}
    position {10}
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
