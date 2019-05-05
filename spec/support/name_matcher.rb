RSpec::Matchers.define :have_name do |expected|
  match do |actual|
    actual.name
  end

  description do
    "have name #{expected}"
  end

  failure_message do |actual|
    "expected player #{actual.name} to have name #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected player #{actual.name} not to have name #{expected}, but it did"
  end
end