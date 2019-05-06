RSpec::Matchers.define :have_position do |expected|
  match do |actual|
    actual.position == expected
  end

  description do
    "have a current position of #{expected} on the board"
  end

  failure_message do |actual|
    "expected player #{actual.name} to have position #{expected}, but was #{actual.position}"
  end

  failure_message_when_negated do |actual|
    "expected player #{actual.name} not to have position #{expected}, but it did"
  end
end
