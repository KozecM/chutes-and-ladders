class BigDependency
  def execute
    sleep(5)
  end
end

class FakeBigDependency
  def execute
    'finished'
  end
end