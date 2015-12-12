class Position < Struct.new(:point, :direction)
  def to_s
    "#{point},#{direction}"
  end
end
