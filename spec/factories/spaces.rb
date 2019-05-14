Factorybot.define do
  factory :space_empty do
    space_type: "empty"
    destination: nil
  end

  factory :space_chute do
    space_type: "chute"
    destination: 10
  end

  factory :spaces_ladder do
    space_type: "ladder"
    destination: 20
end