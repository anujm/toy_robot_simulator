class Point < Struct.new(:x, :y)
  def to_s
    "#{x},#{y}"
  end
end
