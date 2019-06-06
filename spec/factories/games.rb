FactoryBot.define do
  factory :game, class: Game do
    name { "FAKE GAME" }
  end

  factory :nameless_game, class: Game do
    name { "" }
  end

  factory :nil_game, class: Game do
    name { nil }
  end

  factory :game_1_player, class: Game do
    name {"game with 1 player"}
  end

end
