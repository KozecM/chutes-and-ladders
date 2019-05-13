module GamesHelper
  SPACESDATA = [
    {type: "empty", destination: nil}, # 1
    {type: "ladder", destination: 38}, # 2
    {type: "empty", destination: nil}, # 3
    {type: "empty", destination: nil}, # 4
    {type: "empty", destination: nil}, # 5
    {type: "empty", destination: nil}, # 6
    {type: "ladder", destination: 14}, # 7
    {type: "ladder", destination: 31}, # 8
    {type: "empty", destination: nil}, # 9
    {type: "empty", destination: nil}, # 10
    {type: "empty", destination: nil}, # 11
    {type: "empty", destination: nil}, # 12
    {type: "empty", destination: nil}, # 13
    {type: "empty", destination: nil}, # 14
    {type: "ladder", destination: 26}, # 15
    {type: "chute", destination: 6}, # 16
    {type: "empty", destination: nil}, # 17
    {type: "empty", destination: nil}, # 18
    {type: "empty", destination: nil}, # 19
    {type: "empty", destination: nil}, # 20
    {type: "ladder", destination: 42}, # 21
    {type: "empty", destination: nil}, # 22
    {type: "empty", destination: nil}, # 23
    {type: "empty", destination: nil}, # 24
    {type: "empty", destination: nil}, # 25
    {type: "empty", destination: nil}, # 26
    {type: "empty", destination: nil}, # 27
    {type: "ladder", destination: 84}, # 28
    {type: "empty", destination: nil}, # 29
    {type: "empty", destination: nil}, # 30
    {type: "empty", destination: nil}, # 31
    {type: "empty", destination: nil}, # 32
    {type: "empty", destination: nil}, # 33
    {type: "empty", destination: nil}, # 34
    {type: "empty", destination: nil}, # 35
    {type: "ladder", destination: 44}, # 36
    {type: "empty", destination: nil}, # 37
    {type: "empty", destination: nil}, # 38
    {type: "empty", destination: nil}, # 39
    {type: "empty", destination: nil}, # 40
    {type: "empty", destination: nil}, # 41
    {type: "empty", destination: nil}, # 42
    {type: "empty", destination: nil}, # 43
    {type: "empty", destination: nil}, # 44
    {type: "empty", destination: nil}, # 45
    {type: "chute", destination: 25}, # 46
    {type: "empty", destination: nil}, # 47
    {type: "empty", destination: nil}, # 48
    {type: "chute", destination: 11}, # 49
    {type: "empty", destination: nil}, # 50
    {type: "ladder", destination: 67}, # 51
    {type: "empty", destination: nil}, # 52
    {type: "empty", destination: nil}, # 53
    {type: "empty", destination: nil}, # 54
    {type: "empty", destination: nil}, # 55
    {type: "empty", destination: nil}, # 56
    {type: "empty", destination: nil}, # 57
    {type: "empty", destination: nil}, # 58
    {type: "empty", destination: nil}, # 59
    {type: "empty", destination: nil}, # 60
    {type: "empty", destination: nil}, # 61
    {type: "chute", destination: 19}, # 62
    {type: "empty", destination: nil}, # 63
    {type: "chute", destination: 60}, # 64
    {type: "empty", destination: nil}, # 65
    {type: "empty", destination: nil}, # 66
    {type: "empty", destination: nil}, # 67
    {type: "empty", destination: nil}, # 68
    {type: "empty", destination: nil}, # 69
    {type: "empty", destination: nil}, # 70
    {type: "empty", destination: nil}, # 71
    {type: "empty", destination: nil}, # 72
    {type: "empty", destination: nil}, # 73
    {type: "chute", destination: 53}, # 74
    {type: "empty", destination: nil}, # 75
    {type: "empty", destination: nil}, # 76
    {type: "empty", destination: nil}, # 77
    {type: "ladder", destination: 98}, # 78
    {type: "empty", destination: nil}, # 79
    {type: "empty", destination: nil}, # 80
    {type: "empty", destination: nil}, # 81
    {type: "empty", destination: nil}, # 82
    {type: "empty", destination: nil}, # 83
    {type: "empty", destination: nil}, # 84
    {type: "empty", destination: nil}, # 85
    {type: "empty", destination: nil}, # 86
    {type: "ladder", destination: 94}, # 87
    {type: "empty", destination: nil}, # 88
    {type: "chute", destination: 68}, # 89
    {type: "empty", destination: nil}, # 90
    {type: "empty", destination: nil}, # 91
    {type: "chute", destination: 88}, # 92
    {type: "empty", destination: nil}, # 93
    {type: "empty", destination: nil}, # 94
    {type: "chute", destination: 75}, # 95
    {type: "empty", destination: nil}, # 96
    {type: "empty", destination: nil}, # 97
    {type: "empty", destination: nil}, # 98
    {type: "chute", destination: 80}, # 99
    {type: "empty", destination: nil}, # 100
  ]

  def self.generate_spaces
    spaces = []
    SPACESDATA.each do |config|
      spaces << Space.new(config)
    end
    spaces
  end
  
end
