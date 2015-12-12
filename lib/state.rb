class State
  attr_accessor :context

  def initialize(context)
    @context = context
  end

  def report
    "#{@context.position}"
  end
end
