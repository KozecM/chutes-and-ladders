class Space
  attr_reader :destination, :type

  def initialize(**options)
    @destination = options[:destination] || nil
    @type = options[:type] || "empty"
  end

end