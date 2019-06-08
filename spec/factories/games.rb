FactoryBot.define do
  factory :game, class: Game do
    name { "FAKE GAME" }
    spaces { GamesHelper::generate_spaces }
  end

  factory :nameless_game, class: Game do
    name { "" }
  end

  factory :nil_game, class: Game do
    name { nil }
  end


end
